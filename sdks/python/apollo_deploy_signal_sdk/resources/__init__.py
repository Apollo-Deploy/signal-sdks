"""API resource modules for apollo_deploy_signal_sdk."""

from .emails import EmailsAPI
from .metrics import MetricsAPI
from .suppressions import SuppressionsAPI
from .segments import SegmentsAPI
from .topics import TopicsAPI
from .contact_properties import ContactPropertiesAPI
from .contacts import ContactsAPI
from .webhooks import WebhooksAPI
from .api_keys import ApiKeysAPI
from .projects import ProjectsAPI
from .sending_domains import SendingDomainsAPI

__all__ = [
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
