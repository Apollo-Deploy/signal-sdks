package signal

import (
	"context"
	"time"
)

// ClientConfig configures the API client.
type ClientConfig struct {
	BaseURL string
	Timeout             time.Duration
	MaxRetries          int
	RetryUnsafeRequests bool
	DefaultHeaders      map[string]string
}

type ClientOption func(*ClientConfig)

func WithBaseURL(url string) ClientOption { return func(c *ClientConfig) { c.BaseURL = url } }
func WithTimeout(timeout time.Duration) ClientOption { return func(c *ClientConfig) { c.Timeout = timeout } }
func WithMaxRetries(retries int) ClientOption { return func(c *ClientConfig) { c.MaxRetries = retries } }
func WithUnsafeRetries(enabled bool) ClientOption {
	return func(c *ClientConfig) { c.RetryUnsafeRequests = enabled }
}
func WithDefaultHeader(key, value string) ClientOption {
	return func(c *ClientConfig) {
		if c.DefaultHeaders == nil { c.DefaultHeaders = make(map[string]string) }
		c.DefaultHeaders[key] = value
	}
}

func DefaultConfig() ClientConfig {
	return ClientConfig{
		BaseURL: "https://signal.apollodeploy.com", Timeout: 15 * time.Second, MaxRetries: 3,
	}
}

// Client is safe for concurrent use by multiple goroutines.
type Client struct {
	config ClientConfig
	transport *Transport
	Emails *EmailsAPI
	Metrics *MetricsAPI
	Suppressions *SuppressionsAPI
	Segments *SegmentsAPI
	Topics *TopicsAPI
	ContactProperties *ContactPropertiesAPI
	Contacts *ContactsAPI
	Webhooks *WebhooksAPI
	ApiKeys *ApiKeysAPI
	Projects *ProjectsAPI
	SendingDomains *SendingDomainsAPI
}

func NewClient(opts ...ClientOption) *Client {
	cfg := DefaultConfig()
	for _, option := range opts { option(&cfg) }
	t := NewTransport(TransportConfig{
		BaseURL: cfg.BaseURL,
		Timeout: cfg.Timeout,
		MaxRetries: cfg.MaxRetries,
		RetryUnsafeRequests: cfg.RetryUnsafeRequests,
		Headers: cfg.DefaultHeaders,
		UserAgent: "signal-go-sdk/1.0.4",
	})
	return &Client{
		config: cfg,
		transport: t,
		Emails: &EmailsAPI{transport: t},
		Metrics: &MetricsAPI{transport: t},
		Suppressions: &SuppressionsAPI{transport: t},
		Segments: &SegmentsAPI{transport: t},
		Topics: &TopicsAPI{transport: t},
		ContactProperties: &ContactPropertiesAPI{transport: t},
		Contacts: &ContactsAPI{transport: t},
		Webhooks: &WebhooksAPI{transport: t},
		ApiKeys: &ApiKeysAPI{transport: t},
		Projects: &ProjectsAPI{transport: t},
		SendingDomains: &SendingDomainsAPI{transport: t},
	}
}

func (c *Client) Transport() *Transport { return c.transport }
func (c *Client) CloseIdleConnections() { c.transport.CloseIdleConnections() }

func Int(value int) *int { return &value }
func String(value string) *string { return &value }
func Bool(value bool) *bool { return &value }

type SSEEvent struct { Event, Data, ID string; Retry int }
type SSEOption func(*sseConfig)
type sseConfig struct { signal context.Context; eventTypes []string }
func WithSSESignal(ctx context.Context) SSEOption { return func(c *sseConfig) { c.signal = ctx } }
func WithSSEEventTypes(types ...string) SSEOption { return func(c *sseConfig) { c.eventTypes = types } }
