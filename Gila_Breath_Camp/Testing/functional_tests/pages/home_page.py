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
	
	def enter_guar_ssn(self, ssn):
		self.browser.find_element_by_id('g_ssn').send_keys(ssn)
	
	def enter_g_f_name(self, g_first_name):
		self.browser.find_element_by_id('g_first_name').send_keys(g_first_name)
	
	def enter_g_l_name(self, g_last_name):
		self.browser.find_element_by_id('g_last_name').send_keys(g_last_name)
	
	def enter_g_address(self,address):
		self.browser.find_element_by_id('g_address').send_keys(address)
	
	def enter_g_contact_info(self,contact):
		self.browser.find_element_by_id('g_contact_info').send_keys(contact)
	
	def enter_g_emergency_contact(self,contact):
		self.browser.find_element_by_id('g_emergency_contact').send_keys(contact)
	
	def enter_g_payment(self,pay):
		self.browser.find_element_by_id('g_payment').send_keys(pay)
	
	def click_register_button(self):
		self.browser.find_element_by_id("btnCmp").click()


