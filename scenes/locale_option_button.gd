# extends OptionButton

# const SCROLL_SENSITIVITY := 0.1

# var _was_just_dragging := false
# var _scroll_offset := 0

# @onready var _popup := get_popup()

# func _ready() -> void:
# 	_popup.hide_on_item_selection = false
# 	_popup.hide_on_checkable_item_selection = false
# 	_popup.window_input.connect(_on_popup_window_input)

# func _on_popup_window_input(event: InputEvent) -> void:
# 	print("event")

# 	_popup.hide_on_item_selection = false
# 	_popup.hide_on_checkable_item_selection = false

# 	if event is InputEventScreenDrag:
# 		var drag_event := event as InputEventScreenDrag
# 		_scroll_offset -= int(drag_event.relative.y * SCROLL_SENSITIVITY)
# 		_scroll_offset = clamp(_scroll_offset, 0, _popup.get_item_count() - 1)
# 		_popup.scroll_to_item(_scroll_offset)
# 		_was_just_dragging = true
# 		return

# 	if event is InputEventMouseButton:
# 		var button_event := event as InputEventMouseButton
# 		if button_event.pressed == false:
# 			if not _was_just_dragging:
# 				_popup.hide_on_item_selection = true
# 				_popup.hide_on_checkable_item_selection = true
# 			_was_just_dragging = false
