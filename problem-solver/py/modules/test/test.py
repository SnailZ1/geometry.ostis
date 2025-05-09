import logging
from sc_client.models import ScAddr, ScLinkContentType, ScTemplate
from sc_client.constants import sc_type
from sc_client.client import search_by_template

from sc_kpm import ScAgentClassic, ScResult
from sc_kpm.sc_sets import ScSet
from sc_kpm.utils import (
    generate_link,
    get_link_content_data,
    check_connector, generate_connector,
    erase_connectors,
    search_element_by_non_role_relation,
    get_element_system_identifier,
    search_connector
)
from sc_kpm.utils.action_utils import (
    generate_action_result,
    finish_action_with_status,
    get_action_arguments,
)
from sc_kpm import ScKeynodes

import requests

class UserTest(ScAgentClassic):
    def __init__(self):
        super().__init__("action_show_weather")

    def on_event(self, event_element: ScAddr, event_edge: ScAddr, action_element: ScAddr) -> ScResult:
        result = self.run(action_element)
        is_successful = result == ScResult.OK
        finish_action_with_status(action_element, is_successful)
        self.logger.info("Test finished %s",
                         "successfully" if is_successful else "unsuccessfully")
        return result

    def run(self, action_node: ScAddr) -> ScResult:
        self.logger.info("WeatherAgent started")

        return 1