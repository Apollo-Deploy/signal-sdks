package signal

import (
	"bufio"
	"strconv"
	"context"
	"strings"
)

// EmailsAPI provides access to emails API operations.
type EmailsAPI struct {
	transport *Transport
}

func (api *EmailsAPI) SendEmail(
	ctx context.Context,
	body SendEmailRequest,
) (*SendEmailResponse, error) {
	reqPath := buildPath("/v1/emails")
	req := request{
		Method: "POST", Path: reqPath,

		Body: body, ContentType: "application/json",


	}
	var result SendEmailResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *EmailsAPI) GetEmail(
	ctx context.Context,
	emailId string,
) (*EmailDetailResponse, error) {
	reqPath := buildPath("/v1/emails/${emailId}", "emailId", emailId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result EmailDetailResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *EmailsAPI) BatchSendEmails(
	ctx context.Context,
	body BatchSendRequest,
) (*BatchSendResponse, error) {
	reqPath := buildPath("/v1/emails/batch")
	req := request{
		Method: "POST", Path: reqPath,

		Body: body, ContentType: "application/json",


	}
	var result BatchSendResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *EmailsAPI) CancelEmail(
	ctx context.Context,
	emailId string,
) (*CancelResponse, error) {
	reqPath := buildPath("/v1/emails/${emailId}", "emailId", emailId)
	req := request{
		Method: "DELETE", Path: reqPath,




	}
	var result CancelResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *EmailsAPI) BulkCancelEmails(
	ctx context.Context,
) (*BulkCancelResponse, error) {
	reqPath := buildPath("/v1/emails")
	req := request{
		Method: "DELETE", Path: reqPath,




	}
	var result BulkCancelResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *EmailsAPI) IssueStreamToken(
	ctx context.Context,
	projectId string,
) (*StreamTokenResponse, error) {
	reqPath := buildPath("/v1/emails/${projectId}/stream/token", "projectId", projectId)
	req := request{
		Method: "POST", Path: reqPath,




	}
	var result StreamTokenResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *EmailsAPI) StreamEmailEvents(
	ctx context.Context,
) (<-chan SSEEvent, <-chan error) {
	eventCh := make(chan SSEEvent)
	errCh := make(chan error, 1)
	go func() {
		defer close(eventCh)
		defer close(errCh)
		reqPath := buildPath("/v1/emails/stream")
		resp, err := api.transport.Stream(ctx, request{
			Method: "GET", Path: reqPath,




		})
		if err != nil { errCh <- err; return }
		defer resp.Body.Close()
		scanner := bufio.NewScanner(resp.Body)
		scanner.Buffer(make([]byte, 64*1024), maxSSELineBytes)
		current := SSEEvent{Event: "message"}
		hasData := false
		lastEventID := ""
		dispatch := func() bool {
			if !hasData {
				current = SSEEvent{Event: "message"}
				return true
			}
			if current.Event == "" { current.Event = "message" }
			current.ID = lastEventID
			select {
			case eventCh <- current:
				current = SSEEvent{Event: "message"}
				hasData = false
				return true
			case <-ctx.Done():
				return false
			}
		}
		for scanner.Scan() {
			select {
			case <-ctx.Done(): errCh <- ctx.Err(); return
			default:
			}
			line := scanner.Text()
			if line == "" {
				if !dispatch() { errCh <- ctx.Err(); return }
				continue
			}
			if strings.HasPrefix(line, ":") { continue }

			field, value := line, ""
			if separator := strings.IndexByte(line, ':'); separator >= 0 {
				field = line[:separator]
				value = line[separator+1:]
				if strings.HasPrefix(value, " ") { value = value[1:] }
			}
			switch field {
			case "event":
				current.Event = value
			case "data":
				if hasData { current.Data += "\n" }
				current.Data += value
				hasData = true
			case "id":
				if !strings.ContainsRune(value, '\x00') { lastEventID = value }
			case "retry":
				valid := value != ""
				for _, character := range value {
					if character < '0' || character > '9' { valid = false; break }
				}
				if valid {
					if retry, parseErr := strconv.Atoi(value); parseErr == nil {
						current.Retry = retry
					}
				}
			}
		}
		if err := scanner.Err(); err != nil { errCh <- err; return }
		if !dispatch() { errCh <- ctx.Err() }
	}()
	return eventCh, errCh
}

func (api *EmailsAPI) ValidateLinks(
	ctx context.Context,
	body ValidateLinksRequest,
) (*ValidateLinksResponse, error) {
	reqPath := buildPath("/v1/emails/validate")
	req := request{
		Method: "POST", Path: reqPath,

		Body: body, ContentType: "application/json",


	}
	var result ValidateLinksResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
