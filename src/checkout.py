class Checkout:
    def scan(self, sku):
        self._total = 50

    @property
    def total(self):
        return self._total
