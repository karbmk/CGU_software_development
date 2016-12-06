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

	def click_date_2(self):
		self.browser.find_element_by_id("date_2").click()
	
	def select_priority(self):
		#self.browser.find_element_by_id("tab7").click()
		#self.browser.find_element_by_id("tab7").click()
		clerk_btn = self.browser.find_element_by_xpath("//a[@href='#tab7']")
		webdriver.ActionChains(self.browser).move_to_element(clerk_btn).click(clerk_btn).perform()
		#find_element_by_css_selector("#tab7 > div > div.t-box > #btnCmp").click()

	def select_appl_with(self):
		#self.browser.find_element_by_id("sel_appl_name0").click()
		self.browser.find_element_by_xpath("//select[@id='sel_appl_name0']/option[@value='TOLLNER, MITSUE']").click()
		#self.wait_till_element_visible((By.XPATH,"//select[@id='guar_with0']"))
	
	def select_appl_id_with(self):
		self.browser.find_element_by_xpath("//select[@id='guar_with0']/option[@value='10']").click()
	
	def select_appl_not_with(self):
		self.browser.find_element_by_xpath("//select[@id='appl_name_without0']/option[@value='RAO, JAYANT']").click()
	
	def select_appl_id_without(self):
		self.browser.find_element_by_xpath("//select[@id='guar_with0']/option[@value='8']").click()
	
	def click_submit_button(self):
		self.browser.find_element_by_id("btnCmp_submit").click()
	
	def select_update_reg(self):
		#self.browser.find_element_by_id("tab7").click()
		#self.browser.find_element_by_id("tab7").click()
		clerk_btn = self.browser.find_element_by_xpath("//a[@href='#tab8']")
		webdriver.ActionChains(self.browser).move_to_element(clerk_btn).click(clerk_btn).perform()
		#find_element_by_css_selector("#tab7 > div > div.t-box > #btnCmp").click()
	
	def select_appl_id_up(self, appl_id):
		self.browser.find_element_by_id('c_appl_id').send_keys(appl_id)
	
	def click_up_get(self):
		self.browser.find_element_by_id("btnCmp_get").click()
	
	def enter_c_l_name_up(self, c_last_name):
		self.browser.find_element_by_id('c_last_name_up').clear()
		self.browser.find_element_by_id('c_last_name_up').send_keys(c_last_name)
	
	def click_reg_button_up(self):
		self.browser.find_element_by_id("btnCmp_reg_up").click()
	
	def click_checkin(self):
		clerk_btn = self.browser.find_element_by_xpath("//a[@href='#tab3']")
		webdriver.ActionChains(self.browser).move_to_element(clerk_btn).click(clerk_btn).perform()
	
	def click_sub_checkin(self):
		self.browser.find_element_by_id("btnCmp_chk_sub").click()
	
	def click_sel_all(self,sel_all_number):
		#self.browser.find_element_by_id("sel_all0").click()
		self.browser.find_element_by_id(sel_all_number).click()
	
	def click_cancel(self):
		clerk_btn = self.browser.find_element_by_xpath("//a[@href='#tab4']")
		webdriver.ActionChains(self.browser).move_to_element(clerk_btn).click(clerk_btn).perform()
	
	def click_checkbox_cancel(self):
		self.browser.find_element_by_id("cancel4").click()
	
	def click_sub_cancel(self):
		self.browser.find_element_by_id("btnCmp_sub_cancel").click()
