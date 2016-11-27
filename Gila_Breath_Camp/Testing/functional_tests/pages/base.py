import pytest
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

from .page import Page


class Base(Page):
    """
    Base class for global project specific functions
    """
    base_url = "http://localhost:8000/Python/"

    def __init__(self, browser):
        Page.__init__(self, browser)
        

    def visit(self):
        self.browser.get(self.base_url)
        self.wait_for_page_to_load()
