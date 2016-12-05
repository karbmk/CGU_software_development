from selenium import webdriver
import pytest
import time
from .base_test import BaseTest
from ..pages.home_page import HomePage


class TestRegistrationPage(BaseTest):

	def setup_method(self):
		self.home_page = HomePage(self.driver)
		self.home_page.visit()

	def terardown_method(self):
		self.driver.close()

	def test_registration_form_redirection(self):
		print (self.driver.title)
		self.home_page.click_on_clerk_button()
		#import pdb;pdb.set_trace()
		#clerk_btn = driver.find_element_by_xpath("//a[@href='/Static/Templates/tran-his.html']")
		#webdriver.ActionChains(driver).move_to_element(clerk_btn).click(clerk_btn).perform()

	def test_fill_registration_form(self):
		self.home_page.click_on_clerk_button()
		#import pdb;pdb.set_trace()
		time.sleep(1)
		self.home_page.enter_camper_name("Terry","Ryan")
		time.sleep(1)
		self.home_page.enter_campers_age(27)
		time.sleep(1)
		self.home_page.select_camper_gender("male")
		time.sleep(1)
		self.home_page.enter_camper_address("840 Wood St, Clarion, PA 16214, USA")
		time.sleep(1)
		self.home_page.enter_guar_ssn("134-44-1111")
		time.sleep(1)
		self.home_page.enter_g_f_name("Mr")
		time.sleep(1)
		self.home_page.enter_g_l_name("Ryan")
		time.sleep(1)
		self.home_page.enter_g_address("840 Wood St, Clarion, PA 16214, USA")
		time.sleep(1)
		self.home_page.enter_g_contact_info("1234567890")
		time.sleep(1)
		self.home_page.enter_g_emergency_contact("1234567890")
		time.sleep(1)
		self.home_page.enter_g_payment("1000")
		time.sleep(1)
		self.home_page.click_register_button()
		time.sleep(5)


	def test_priority_set(self):
		self.home_page.click_on_clerk_button()
		#import pdb;pdb.set_trace()
		time.sleep(1)
		self.home_page.click_date_2()
		time.sleep(3)
		self.home_page.select_priority()
		time.sleep(3)
		self.home_page.select_appl_with()
		time.sleep(2)
		#self.home_page.select_appl_id_with()
		time.sleep(2)
		self.home_page.select_appl_not_with()
		time.sleep(2)
		#self.home_page.select_appl_id_without()
		time.sleep(2)
		self.home_page.click_submit_button()
		time.sleep(5)
	
	def test_update_register(self):
		self.home_page.click_on_clerk_button()
		#import pdb;pdb.set_trace()
		time.sleep(1)
		self.home_page.click_date_2()
		time.sleep(3)
		self.home_page.select_update_reg()
		time.sleep(3)
		self.home_page.select_appl_id_up("2")
		time.sleep(1)
		self.home_page.click_up_get()
		time.sleep(2)
		self.home_page.enter_c_l_name_up("desouza")
		time.sleep(2)
		self.home_page.click_reg_button_up()
		time.sleep(2)
	
	def test_check_in(self):
		self.home_page.click_on_clerk_button()
		#import pdb;pdb.set_trace()
		time.sleep(1)
		self.home_page.click_date_2()
		time.sleep(3)
		self.home_page.click_checkin()
		time.sleep(3)
		self.home_page.click_sel_all()
		time.sleep(3)
		self.home_page.click_sub_checkin()
		time.sleep(2)