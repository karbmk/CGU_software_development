from selenium import webdriver

from .base import Base
from .page import Page


class HomePage(Page):

	def __init__(self, browser):
		Base.__init__(self, browser)

	def visit(self):
		self.browser.get(Base.base_url)
		self.sleep(10)

	def click_on_clerk_button(self):
		clerk_btn = self.browser.find_element_by_xpath("//a[@href='/Static/Templates/tran-his.html']")
		webdriver.ActionChains(self.browser).move_to_element(clerk_btn).click(clerk_btn).perform()
