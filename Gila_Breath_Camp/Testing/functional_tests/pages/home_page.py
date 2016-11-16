from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select

from .base import Base
from .page import Page


class HomePage(Page):

	REGISTRATION_TAB_XPATH = "//a[@href='#tab1']"
	CAMPER_FIRST_NAME_ID = "c_first_name"
	CAMPER_LAST_NAME_ID = "c_last_name"

	def __init__(self, browser):
		Base.__init__(self, browser)

	def visit(self):
		self.browser.get(Base.base_url)
		self.sleep(1)

	def click_on_clerk_button(self):
		clerk_btn = self.browser.find_element_by_xpath("//a[@href='/Static/Templates/tran-his.html']")
		webdriver.ActionChains(self.browser).move_to_element(clerk_btn).click(clerk_btn).perform()
		self.wait_till_element_visible((By.XPATH,self.REGISTRATION_TAB_XPATH))

	def enter_camper_name(self,first_name,last_name):
		self.browser.find_element_by_id(self.CAMPER_FIRST_NAME_ID).send_keys(first_name)
		self.browser.find_element_by_id(self.CAMPER_LAST_NAME_ID).send_keys(last_name)

	def enter_campers_age(self,age):
		self.browser.find_element_by_id("c_age").send_keys(age)
	
	def select_camper_gender(self,gender):
		gender=gender.upper()		
		select = Select(self.browser.find_element_by_id('c_sex'))
		select.select_by_visible_text(gender)

	def enter_camper_address(self,address):
		self.browser.find_element_by_id('c_address').send_keys(address)


