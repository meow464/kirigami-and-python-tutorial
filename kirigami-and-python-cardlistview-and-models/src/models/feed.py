from PySide2.QtCore import Qt, QAbstractListModel


class FeedModel(QAbstractListModel):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._posts = ["a", "b", "c"]

    def data(self, index, role):
        if role == Qt.DisplayRole:
            return self._posts[index.row()]

    def rowCount(self, index):
        return len(self._posts)
