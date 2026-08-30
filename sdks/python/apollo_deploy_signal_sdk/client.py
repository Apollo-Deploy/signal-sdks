"Apollo Signal API SDK Client"

from typing import Optional, Dict, Any, List, Callable, Union
import httpx
from .transport import create_transport, SDKTransport, RequestOptions
from .resources.emails import EmailsAPI
from .resources.metrics import MetricsAPI
from .resources.suppressions import SuppressionsAPI
from .resources.segments import SegmentsAPI
from .resources.topics import TopicsAPI
from .resources.contact_properties import ContactPropertiesAPI
from .resources.contacts import ContactsAPI
from .resources.webhooks import WebhooksAPI
from .resources.api_keys import ApiKeysAPI
from .resources.projects import ProjectsAPI
from .resources.sending_domains import SendingDomainsAPI

class ApolloSignalApiClientConfig:
    "Configuration for Apollo Signal API client."

    def __init__(
        self,
        base_url: str = "https://signal.apollodeploy.com",
        timeout_ms: int = 15000,
        retries: int = 3,
        retry_unsafe_requests: bool = False,
        default_headers: Optional[Dict[str, str]] = None,
        on_request: Optional[Callable] = None,
        on_response: Optional[Callable] = None,
        on_error: Optional[Callable] = None,
    ):
        self.base_url = base_url
        self.timeout_ms = timeout_ms
        self.retries = retries
        self.retry_unsafe_requests = retry_unsafe_requests
        self.default_headers = default_headers or {}
        self.on_request = on_request
        self.on_response = on_response
        self.on_error = on_error


class ApolloSignalApiClient:
    "Apollo Signal API SDK Client"

    def __init__(self, config: Optional[ApolloSignalApiClientConfig] = None):
        self.config = config or ApolloSignalApiClientConfig()
        self._transport = create_transport(
            base_url=self.config.base_url,
            timeout_ms=self.config.timeout_ms,
            retries=self.config.retries,
            retry_unsafe_requests=self.config.retry_unsafe_requests,
            default_headers=self.config.default_headers,
            on_request=self.config.on_request,
            on_response=self.config.on_response,
            on_error=self.config.on_error,
        )
        self.emails = EmailsAPI(self._transport)
        self.metrics = MetricsAPI(self._transport)
        self.suppressions = SuppressionsAPI(self._transport)
        self.segments = SegmentsAPI(self._transport)
        self.topics = TopicsAPI(self._transport)
        self.contact_properties = ContactPropertiesAPI(self._transport)
        self.contacts = ContactsAPI(self._transport)
        self.webhooks = WebhooksAPI(self._transport)
        self.api_keys = ApiKeysAPI(self._transport)
        self.projects = ProjectsAPI(self._transport)
        self.sending_domains = SendingDomainsAPI(self._transport)

    def close(self) -> None:
        """Close the underlying HTTP connection pool."""
        self._transport.close()

    def __enter__(self) -> "ApolloSignalApiClient":
        return self

    def __exit__(self, *_: Any) -> None:
        self.close()


def create_apollo_signal_api_client(
    base_url: str = "https://signal.apollodeploy.com",
    **kwargs,
) -> ApolloSignalApiClient:
    "Create a new Apollo Signal API SDK client."
    config = ApolloSignalApiClientConfig(
        base_url=base_url,
        **kwargs,
    )
    return ApolloSignalApiClient(config)
