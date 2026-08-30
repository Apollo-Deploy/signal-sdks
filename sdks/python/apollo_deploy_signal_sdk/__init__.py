"""
Apollo Signal API Python SDK
"""

from .client import create_apollo_signal_api_client, ApolloSignalApiClient
from .errors import SDKError
from .transport import SSEEvent
from .resources import (
    EmailsAPI,
    MetricsAPI,
    SuppressionsAPI,
    SegmentsAPI,
    TopicsAPI,
    ContactPropertiesAPI,
    ContactsAPI,
    WebhooksAPI,
    ApiKeysAPI,
    ProjectsAPI,
    SendingDomainsAPI,
)

__all__ = [
    "create_apollo_signal_api_client",
    "ApolloSignalApiClient",
    "SDKError",
    "SSEEvent",
    "EmailsAPI",
    "MetricsAPI",
    "SuppressionsAPI",
    "SegmentsAPI",
    "TopicsAPI",
    "ContactPropertiesAPI",
    "ContactsAPI",
    "WebhooksAPI",
    "ApiKeysAPI",
    "ProjectsAPI",
    "SendingDomainsAPI",
]
