from sc_kpm import ScModule
from .test import UserTest


class TestModule(ScModule):
    def __init__(self):
        super().__init__(UserTest())