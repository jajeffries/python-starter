import unittest

from src.checkout import Checkout


class MyTest(unittest.TestCase):
    def test_something(self):
        co = Checkout()
        co.scan('A')
        self.assertEqual(31, co.total)
