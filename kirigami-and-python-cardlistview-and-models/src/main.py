#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import sys

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine, qmlRegisterType

from models.feed import FeedModel

if __name__ == "__main__":
    app = QGuiApplication()
    engine = QQmlApplicationEngine()

    qmlRegisterType(FeedModel, "BloopModels", 1, 0, "FeedModel")
    context = engine.rootContext()

    engine.setImportPathList(
        engine.importPathList() + ["/usr/lib/x86_64-linux-gnu/qt5/qml/"]
    )

    engine.load("./ui/main.qml")

    if len(engine.rootObjects()) == 0:
        sys.exit(-1)
    sys.exit(app.exec_())
