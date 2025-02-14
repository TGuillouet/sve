class_name TopNAcceptDialog
extends AcceptDialog

signal on_dialog_confirmed(top_n: int)

@onready var _spinbox: SpinBox = get_node("SpinBox")

var current_value: int = 0

func _ready() -> void:
	_spinbox.value_changed.connect(self._on_value_changed)
	self.confirmed.connect(self.on_confirmed)

func on_confirmed():
	on_dialog_confirmed.emit(current_value)
	self.get_parent().remove_child(self)

func _on_value_changed(new_value: float):
	current_value = int(new_value)
