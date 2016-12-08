py.test Testing/functional_tests/tests -k test_main_priority
py.test Testing/functional_tests/tests -k test_main_check_in
py.test Testing/functional_tests/tests -k test_main_update_register
py.test Testing/functional_tests/tests -k test_main_cancel
python check_for_error.py