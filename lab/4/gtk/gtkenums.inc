;~ GtkButtonsType
GTK_BUTTONS_NONE        equ 0
GTK_BUTTONS_OK          equ 1
GTK_BUTTONS_CLOSE       equ 2
GTK_BUTTONS_CANCEL      equ 3
GTK_BUTTONS_YES_NO      equ 4
GTK_BUTTONS_OK_CANCEL   equ 5

;~ GtkDialogFlags:
;~ Flags used to influence dialog construction.
GTK_DIALOG_MODAL                equ 1 << 0
GTK_DIALOG_DESTROY_WITH_PARENT  equ 1 << 1

;~ GtkResponseType
GTK_RESPONSE_NONE               equ -1
GTK_RESPONSE_REJECT             equ -2
GTK_RESPONSE_ACCEPT             equ -3
GTK_RESPONSE_DELETE_EVENT       equ -4
GTK_RESPONSE_OK                 equ -5
GTK_RESPONSE_CANCEL             equ -6
GTK_RESPONSE_CLOSE              equ -7
GTK_RESPONSE_YES                equ -8
GTK_RESPONSE_NO                 equ -9
GTK_RESPONSE_APPLY              equ -10
GTK_RESPONSE_HELP               equ -11

;~ GtkAlign
;~ Controls how a widget deals with extra space in a single (x or y) dimension.
GTK_ALIGN_FILL          equ 0
GTK_ALIGN_START         equ 1
GTK_ALIGN_END           equ 2
GTK_ALIGN_CENTER        equ 3

;~ GtkArrowPlacement
;~ Used to specify the placement of scroll arrows in scrolling menus.
GTK_ARROWS_BOTH         equ 0
GTK_ARROWS_START        equ 1
GTK_ARROWS_END          equ 2

;~ GtkArrowType
;~ Used to indicate the direction in which a #GtkArrow should point.
GTK_ARROW_UP            equ 0
GTK_ARROW_DOWN          equ 1
GTK_ARROW_LEFT          equ 2
GTK_ARROW_RIGHT         equ 3
GTK_ARROW_NONE          equ 4

;~ GtkAttachOptions:
;~ Denotes the expansion properties that a widget will have when it (or its parent) is resized.
GTK_EXPAND              equ 1 << 0
GTK_SHRINK              equ 1 << 1
GTK_FILL                equ 1 << 2

;~ GtkButtonBoxStyle
;~ Used to dictate the style that a #GtkButtonBox uses to layout the buttons it contains. 
;~ (See also: #GtkVButtonBox and #GtkHButtonBox).
GTK_BUTTONBOX_SPREAD    equ 1
GTK_BUTTONBOX_EDGE      equ 2
GTK_BUTTONBOX_START     equ 3
GTK_BUTTONBOX_END       equ 4
GTK_BUTTONBOX_CENTER    equ 5

;~ GtkDeleteType
GTK_DELETE_CHARS                equ 0
GTK_DELETE_WORD_ENDS            equ 1
GTK_DELETE_WORDS                equ 2
GTK_DELETE_DISPLAY_LINES        equ 3
GTK_DELETE_DISPLAY_LINE_ENDS    equ 4
GTK_DELETE_PARAGRAPH_ENDS       equ 5
GTK_DELETE_PARAGRAPHS           equ 6
GTK_DELETE_WHITESPACE           equ 7

;~ GtkDirectionType
;~ Focus movement types
GTK_DIR_TAB_FORWARD     equ 0
GTK_DIR_TAB_BACKWARD    equ 1
GTK_DIR_UP              equ 2
GTK_DIR_DOWN            equ 3
GTK_DIR_LEFT            equ 4
GTK_DIR_RIGHT           equ 5

;~ GtkExpanderStyle
;~ Used to specify the style of the expanders drawn by a #GtkTreeView.
GTK_EXPANDER_COLLAPSED          equ 0
GTK_EXPANDER_SEMI_COLLAPSED     equ 1
GTK_EXPANDER_SEMI_EXPANDED      equ 2
GTK_EXPANDER_EXPANDED           equ 3

;~ GtkIconSize
;~ Built-in stock icon sizes
GTK_ICON_SIZE_INVALID           equ 0
GTK_ICON_SIZE_MENU              equ 1
GTK_ICON_SIZE_SMALL_TOOLBAR     equ 2
GTK_ICON_SIZE_LARGE_TOOLBAR     equ 3
GTK_ICON_SIZE_BUTTON            equ 4
GTK_ICON_SIZE_DND               equ 5
GTK_ICON_SIZE_DIALOG            equ 6

 ;~ * GtkSensitivityType:
 ;~ * @GTK_SENSITIVITY_AUTO: The arrow is made insensitive if the
 ;~ *   thumb is at the end
 ;~ * @GTK_SENSITIVITY_ON: The arrow is always sensitive
 ;~ * @GTK_SENSITIVITY_OFF: The arrow is always insensitive
 ;~ *
 ;~ * Determines how GTK+ handles the sensitivity of stepper arrows
 ;~ * at the end of range widgets.
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_SENSITIVITY_AUTO,
  ;~ GTK_SENSITIVITY_ON,
  ;~ GTK_SENSITIVITY_OFF
;~ } GtkSensitivityType;
;~ 
;~ /* Reading directions for text */
;~ typedef enum
;~ {
  ;~ GTK_TEXT_DIR_NONE,
  ;~ GTK_TEXT_DIR_LTR,
  ;~ GTK_TEXT_DIR_RTL
;~ } GtkTextDirection;
;~ 
;~ /**
 ;~ * GtkJustification:
 ;~ * @GTK_JUSTIFY_LEFT: The text is placed at the left edge of the label.
 ;~ * @GTK_JUSTIFY_RIGHT: The text is placed at the right edge of the label.
 ;~ * @GTK_JUSTIFY_CENTER: The text is placed in the center of the label.
 ;~ * @GTK_JUSTIFY_FILL: The text is placed is distributed across the label.
 ;~ *
 ;~ * Used for justifying the text inside a #GtkLabel widget. (See also
 ;~ * #GtkAlignment).
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_JUSTIFY_LEFT,
  ;~ GTK_JUSTIFY_RIGHT,
  ;~ GTK_JUSTIFY_CENTER,
  ;~ GTK_JUSTIFY_FILL
;~ } GtkJustification;
;~ 
;~ /**
 ;~ * GtkMenuDirectionType:
 ;~ * @GTK_MENU_DIR_PARENT: To the parent menu shell
 ;~ * @GTK_MENU_DIR_CHILD: To the submenu, if any, associated with the item
 ;~ * @GTK_MENU_DIR_NEXT: To the next menu item
 ;~ * @GTK_MENU_DIR_PREV: To the previous menu item
 ;~ *
 ;~ * An enumeration representing directional movements within a menu.
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_MENU_DIR_PARENT,
  ;~ GTK_MENU_DIR_CHILD,
  ;~ GTK_MENU_DIR_NEXT,
  ;~ GTK_MENU_DIR_PREV
;~ } GtkMenuDirectionType;
;~ 
;~ /**

;~ GtkMessageType
;~ The type of message being displayed in the dialog.
GTK_MESSAGE_INFO        equ 0
GTK_MESSAGE_WARNING     equ 1
GTK_MESSAGE_QUESTION    equ 2
GTK_MESSAGE_ERROR       equ 3
GTK_MESSAGE_OTHER       equ 4


;~ /**
 ;~ * GtkMovementStep:
 ;~ * @GTK_MOVEMENT_LOGICAL_POSITIONS: Move forward or back by graphemes
 ;~ * @GTK_MOVEMENT_VISUAL_POSITIONS:  Move left or right by graphemes
 ;~ * @GTK_MOVEMENT_WORDS:             Move forward or back by words
 ;~ * @GTK_MOVEMENT_DISPLAY_LINES:     Move up or down lines (wrapped lines)
 ;~ * @GTK_MOVEMENT_DISPLAY_LINE_ENDS: Move to either end of a line
 ;~ * @GTK_MOVEMENT_PARAGRAPHS:        Move up or down paragraphs (newline-ended lines)
 ;~ * @GTK_MOVEMENT_PARAGRAPH_ENDS:    Move to either end of a paragraph
 ;~ * @GTK_MOVEMENT_PAGES:             Move by pages
 ;~ * @GTK_MOVEMENT_BUFFER_ENDS:       Move to ends of the buffer
 ;~ * @GTK_MOVEMENT_HORIZONTAL_PAGES:  Move horizontally by pages
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_MOVEMENT_LOGICAL_POSITIONS,
  ;~ GTK_MOVEMENT_VISUAL_POSITIONS,
  ;~ GTK_MOVEMENT_WORDS,
  ;~ GTK_MOVEMENT_DISPLAY_LINES,
  ;~ GTK_MOVEMENT_DISPLAY_LINE_ENDS,
  ;~ GTK_MOVEMENT_PARAGRAPHS,
  ;~ GTK_MOVEMENT_PARAGRAPH_ENDS,
  ;~ GTK_MOVEMENT_PAGES,
  ;~ GTK_MOVEMENT_BUFFER_ENDS,
  ;~ GTK_MOVEMENT_HORIZONTAL_PAGES
;~ } GtkMovementStep;
;~ 
;~ typedef enum
;~ {
  ;~ GTK_SCROLL_STEPS,
  ;~ GTK_SCROLL_PAGES,
  ;~ GTK_SCROLL_ENDS,
  ;~ GTK_SCROLL_HORIZONTAL_STEPS,
  ;~ GTK_SCROLL_HORIZONTAL_PAGES,
  ;~ GTK_SCROLL_HORIZONTAL_ENDS
;~ } GtkScrollStep;
;~ 
;~ /**
 ;~ * GtkOrientation:
 ;~ * @GTK_ORIENTATION_HORIZONTAL: The widget is in horizontal orientation.
 ;~ * @GTK_ORIENTATION_VERTICAL: The widget is in vertical orientation.
 ;~ *
 ;~ * Represents the orientation of widgets which can be switched between horizontal
 ;~ * and vertical orientation on the fly, like #GtkToolbar.
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_ORIENTATION_HORIZONTAL,
  ;~ GTK_ORIENTATION_VERTICAL
;~ } GtkOrientation;
;~ 
;~ /**
 ;~ * GtkCornerType:
 ;~ * @GTK_CORNER_TOP_LEFT: Place the scrollbars on the right and bottom of the
 ;~ *  widget (default behaviour).
 ;~ * @GTK_CORNER_BOTTOM_LEFT: Place the scrollbars on the top and right of the
 ;~ *  widget.
 ;~ * @GTK_CORNER_TOP_RIGHT: Place the scrollbars on the left and bottom of the
 ;~ *  widget.
 ;~ * @GTK_CORNER_BOTTOM_RIGHT: Place the scrollbars on the top and left of the
 ;~ *  widget.
 ;~ *
 ;~ * Specifies which corner a child widget should be placed in when packed into
 ;~ * a #GtkScrolledWindow. This is effectively the opposite of where the scroll
 ;~ * bars are placed.
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_CORNER_TOP_LEFT,
  ;~ GTK_CORNER_BOTTOM_LEFT,
  ;~ GTK_CORNER_TOP_RIGHT,
  ;~ GTK_CORNER_BOTTOM_RIGHT
;~ } GtkCornerType;
;~ 
;~ /**
 ;~ * GtkPackType:
 ;~ * @GTK_PACK_START: The child is packed into the start of the box
 ;~ * @GTK_PACK_END: The child is packed into the end of the box
 ;~ *
 ;~ * Represents the packing location #GtkBox children. (See: #GtkVBox,
 ;~ * #GtkHBox, and #GtkButtonBox).
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_PACK_START,
  ;~ GTK_PACK_END
;~ } GtkPackType;
;~ 
;~ /* priorities for path lookups */
;~ typedef enum
;~ {
  ;~ GTK_PATH_PRIO_LOWEST      = 0,
  ;~ GTK_PATH_PRIO_GTK	    = 4,
  ;~ GTK_PATH_PRIO_APPLICATION = 8,
  ;~ GTK_PATH_PRIO_THEME       = 10,
  ;~ GTK_PATH_PRIO_RC          = 12,
  ;~ GTK_PATH_PRIO_HIGHEST     = 15
;~ } GtkPathPriorityType;
;~ #define GTK_PATH_PRIO_MASK 0x0f
;~ 
;~ /* widget path types */
;~ typedef enum
;~ {
  ;~ GTK_PATH_WIDGET,
  ;~ GTK_PATH_WIDGET_CLASS,
  ;~ GTK_PATH_CLASS
;~ } GtkPathType;
;~ 
;~ /**
 ;~ * GtkPolicyType:
 ;~ * @GTK_POLICY_ALWAYS: The scrollbar is always visible.
 ;~ * @GTK_POLICY_AUTOMATIC: The scrollbar will appear and disappear as necessary. For example,
 ;~ *  when all of a #GtkCList can not be seen.
 ;~ * @GTK_POLICY_NEVER: The scrollbar will never appear.
 ;~ *
 ;~ * Determines when a scroll bar will be visible.
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_POLICY_ALWAYS,
  ;~ GTK_POLICY_AUTOMATIC,
  ;~ GTK_POLICY_NEVER
;~ } GtkPolicyType;
;~ 
;~ /**
 ;~ * GtkPositionType:
 ;~ * @GTK_POS_LEFT: The feature is at the left edge.
 ;~ * @GTK_POS_RIGHT: The feature is at the right edge.
 ;~ * @GTK_POS_TOP: The feature is at the top edge.
 ;~ * @GTK_POS_BOTTOM: The feature is at the bottom edge.
 ;~ *
 ;~ * Describes which edge of a widget a certain feature is positioned at, e.g. the
 ;~ * tabs of a #GtkNotebook, the handle of a #GtkHandleBox or the label of a
 ;~ * #GtkScale.
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_POS_LEFT,
  ;~ GTK_POS_RIGHT,
  ;~ GTK_POS_TOP,
  ;~ GTK_POS_BOTTOM
;~ } GtkPositionType;
;~ 
;~ /**
 ;~ * GtkReliefStyle:
 ;~ * @GTK_RELIEF_NORMAL: Draw a normal relief.
 ;~ * @GTK_RELIEF_HALF: A half relief.
 ;~ * @GTK_RELIEF_NONE: No relief.
 ;~ *
 ;~ * Indicated the relief to be drawn around a #GtkButton.
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_RELIEF_NORMAL,
  ;~ GTK_RELIEF_HALF,
  ;~ GTK_RELIEF_NONE
;~ } GtkReliefStyle;
;~ 
;~ /**
 ;~ * GtkResizeMode:
 ;~ * @GTK_RESIZE_PARENT: Pass resize request to the parent
 ;~ * @GTK_RESIZE_QUEUE: Queue resizes on this widget
 ;~ * @GTK_RESIZE_IMMEDIATE: Resize immediately. Deprecated.
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_RESIZE_PARENT,
  ;~ GTK_RESIZE_QUEUE,
  ;~ GTK_RESIZE_IMMEDIATE
;~ } GtkResizeMode;
;~ 
;~ /* scrolling types */
;~ typedef enum
;~ {
  ;~ GTK_SCROLL_NONE,
  ;~ GTK_SCROLL_JUMP,
  ;~ GTK_SCROLL_STEP_BACKWARD,
  ;~ GTK_SCROLL_STEP_FORWARD,
  ;~ GTK_SCROLL_PAGE_BACKWARD,
  ;~ GTK_SCROLL_PAGE_FORWARD,
  ;~ GTK_SCROLL_STEP_UP,
  ;~ GTK_SCROLL_STEP_DOWN,
  ;~ GTK_SCROLL_PAGE_UP,
  ;~ GTK_SCROLL_PAGE_DOWN,
  ;~ GTK_SCROLL_STEP_LEFT,
  ;~ GTK_SCROLL_STEP_RIGHT,
  ;~ GTK_SCROLL_PAGE_LEFT,
  ;~ GTK_SCROLL_PAGE_RIGHT,
  ;~ GTK_SCROLL_START,
  ;~ GTK_SCROLL_END
;~ } GtkScrollType;
;~ 
;~ /**
 ;~ * GtkSelectionMode:
 ;~ * @GTK_SELECTION_NONE: No selection is possible.
 ;~ * @GTK_SELECTION_SINGLE: Zero or one element may be selected.
 ;~ * @GTK_SELECTION_BROWSE: Exactly one element is selected.
 ;~ *     In some circumstances, such as initially or during a search
 ;~ *     operation, it's possible for no element to be selected with
 ;~ *     %GTK_SELECTION_BROWSE. What is really enforced is that the user
 ;~ *     can't deselect a currently selected element except by selecting
 ;~ *     another element.
 ;~ * @GTK_SELECTION_MULTIPLE: Any number of elements may be selected.
 ;~ *      The Ctrl key may be used to enlarge the selection, and Shift
 ;~ *      key to select between the focus and the child pointed to.
 ;~ *      Some widgets may also allow Click-drag to select a range of elements.
 ;~ * @GTK_SELECTION_EXTENDED: Deprecated, behaves identical to %GTK_SELECTION_MULTIPLE.
 ;~ *
 ;~ * Used to control what selections users are allowed to make.
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_SELECTION_NONE,
  ;~ GTK_SELECTION_SINGLE,
  ;~ GTK_SELECTION_BROWSE,
  ;~ GTK_SELECTION_MULTIPLE
;~ } GtkSelectionMode;
;~ 
;~ /**
 ;~ * GtkShadowType:
 ;~ * @GTK_SHADOW_NONE: No outline.
 ;~ * @GTK_SHADOW_IN: The outline is bevelled inwards.
 ;~ * @GTK_SHADOW_OUT: The outline is bevelled outwards like a button.
 ;~ * @GTK_SHADOW_ETCHED_IN: The outline has a sunken 3d appearance.
 ;~ * @GTK_SHADOW_ETCHED_OUT: The outline has a raised 3d appearance.
 ;~ *
 ;~ * Used to change the appearance of an outline typically provided by a #GtkFrame.
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_SHADOW_NONE,
  ;~ GTK_SHADOW_IN,
  ;~ GTK_SHADOW_OUT,
  ;~ GTK_SHADOW_ETCHED_IN,
  ;~ GTK_SHADOW_ETCHED_OUT
;~ } GtkShadowType;
;~ 
;~ /* Widget states */
;~ 
;~ /**
 ;~ * GtkStateType:
 ;~ * @GTK_STATE_NORMAL: State during normal operation.
 ;~ * @GTK_STATE_ACTIVE: State of a currently active widget, such as a depressed button.
 ;~ * @GTK_STATE_PRELIGHT: State indicating that the mouse pointer is over
 ;~ *                      the widget and the widget will respond to mouse clicks.
 ;~ * @GTK_STATE_SELECTED: State of a selected item, such the selected row in a list.
 ;~ * @GTK_STATE_INSENSITIVE: State indicating that the widget is
 ;~ *                         unresponsive to user actions.
 ;~ * @GTK_STATE_INCONSISTENT: The widget is inconsistent, such as checkbuttons
 ;~ *                          or radiobuttons that aren't either set to %TRUE nor %FALSE,
 ;~ *                          or buttons requiring the user attention.
 ;~ * @GTK_STATE_FOCUSED: The widget has the keyboard focus.
 ;~ *
 ;~ * This type indicates the current state of a widget; the state determines how
 ;~ * the widget is drawn. The #GtkStateType enumeration is also used to
 ;~ * identify different colors in a #GtkStyle for drawing, so states can be
 ;~ * used for subparts of a widget as well as entire widgets.
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_STATE_NORMAL,
  ;~ GTK_STATE_ACTIVE,
  ;~ GTK_STATE_PRELIGHT,
  ;~ GTK_STATE_SELECTED,
  ;~ GTK_STATE_INSENSITIVE,
  ;~ GTK_STATE_INCONSISTENT,
  ;~ GTK_STATE_FOCUSED
;~ } GtkStateType;
;~ 
;~ /**
 ;~ * GtkToolbarStyle:
 ;~ * @GTK_TOOLBAR_ICONS: Buttons display only icons in the toolbar.
 ;~ * @GTK_TOOLBAR_TEXT: Buttons display only text labels in the toolbar.
 ;~ * @GTK_TOOLBAR_BOTH: Buttons display text and icons in the toolbar.
 ;~ * @GTK_TOOLBAR_BOTH_HORIZ: Buttons display icons and text alongside each
 ;~ *  other, rather than vertically stacked
 ;~ *
 ;~ * Used to customize the appearance of a #GtkToolbar. Note that
 ;~ * setting the toolbar style overrides the user's preferences
 ;~ * for the default toolbar style.  Note that if the button has only
 ;~ * a label set and GTK_TOOLBAR_ICONS is used, the label will be
 ;~ * visible, and vice versa.
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_TOOLBAR_ICONS,
  ;~ GTK_TOOLBAR_TEXT,
  ;~ GTK_TOOLBAR_BOTH,
  ;~ GTK_TOOLBAR_BOTH_HORIZ
;~ } GtkToolbarStyle;

;~ GtkWindowPosition
GTK_WIN_POS_NONE                equ 0
GTK_WIN_POS_CENTER              equ 1
GTK_WIN_POS_MOUSE               equ 2
GTK_WIN_POS_CENTER_ALWAYS       equ 3
GTK_WIN_POS_CENTER_ON_PARENT    equ 4

;~ GtkWindowType
GTK_WINDOW_TOPLEVEL     equ 0
GTK_WINDOW_POPUP        equ 1
;~ 
 ;~ * GtkWrapMode:
 ;~ * @GTK_WRAP_NONE: do not wrap lines; just make the text area wider
 ;~ * @GTK_WRAP_CHAR: wrap text, breaking lines anywhere the cursor can
 ;~ *     appear (between characters, usually - if you want to be technical,
 ;~ *     between graphemes, see pango_get_log_attrs())
 ;~ * @GTK_WRAP_WORD: wrap text, breaking lines in between words
 ;~ * @GTK_WRAP_WORD_CHAR: wrap text, breaking lines in between words, or if
 ;~ *     that is not enough, also between graphemes
 ;~ *
 ;~ * Describes a type of line wrapping.
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_WRAP_NONE,
  ;~ GTK_WRAP_CHAR,
  ;~ GTK_WRAP_WORD,
  ;~ GTK_WRAP_WORD_CHAR
;~ } GtkWrapMode;
;~ 
;~ /**
 ;~ * GtkSortType:
 ;~ * @GTK_SORT_ASCENDING: Sorting is in ascending order.
 ;~ * @GTK_SORT_DESCENDING: Sorting is in descending order.
 ;~ *
 ;~ * Determines the direction of a sort.
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_SORT_ASCENDING,
  ;~ GTK_SORT_DESCENDING
;~ } GtkSortType;
;~ 
;~ /* Style for gtk input method preedit/status */
;~ typedef enum
;~ {
  ;~ GTK_IM_PREEDIT_NOTHING,
  ;~ GTK_IM_PREEDIT_CALLBACK,
  ;~ GTK_IM_PREEDIT_NONE
;~ } GtkIMPreeditStyle;
;~ 
;~ typedef enum
;~ {
  ;~ GTK_IM_STATUS_NOTHING,
  ;~ GTK_IM_STATUS_CALLBACK,
  ;~ GTK_IM_STATUS_NONE
;~ } GtkIMStatusStyle;
;~ 
;~ /**
 ;~ * GtkPackDirection:
 ;~ * @GTK_PACK_DIRECTION_LTR: Widgets are packed left-to-right
 ;~ * @GTK_PACK_DIRECTION_RTL: Widgets are packed right-to-left
 ;~ * @GTK_PACK_DIRECTION_TTB: Widgets are packed top-to-bottom
 ;~ * @GTK_PACK_DIRECTION_BTT: Widgets are packed bottom-to-top
 ;~ *
 ;~ * Determines how widgets should be packed insided menubars
 ;~ * and menuitems contained in menubars.
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_PACK_DIRECTION_LTR,
  ;~ GTK_PACK_DIRECTION_RTL,
  ;~ GTK_PACK_DIRECTION_TTB,
  ;~ GTK_PACK_DIRECTION_BTT
;~ } GtkPackDirection;
;~ 
;~ typedef enum
;~ {
  ;~ GTK_PRINT_PAGES_ALL,
  ;~ GTK_PRINT_PAGES_CURRENT,
  ;~ GTK_PRINT_PAGES_RANGES,
  ;~ GTK_PRINT_PAGES_SELECTION
;~ } GtkPrintPages;
;~ 
;~ typedef enum
;~ {
  ;~ GTK_PAGE_SET_ALL,
  ;~ GTK_PAGE_SET_EVEN,
  ;~ GTK_PAGE_SET_ODD
;~ } GtkPageSet;
;~ 
;~ /**
 ;~ * GtkNumberUpLayout:
 ;~ * @GTK_NUMBER_UP_LAYOUT_LEFT_TO_RIGHT_TOP_TO_BOTTOM: <inlinegraphic valign="middle" fileref="layout-lrtb.png" format="PNG"></inlinegraphic>
 ;~ * @GTK_NUMBER_UP_LAYOUT_LEFT_TO_RIGHT_BOTTOM_TO_TOP: <inlinegraphic valign="middle" fileref="layout-lrbt.png" format="PNG"></inlinegraphic>
 ;~ * @GTK_NUMBER_UP_LAYOUT_RIGHT_TO_LEFT_TOP_TO_BOTTOM: <inlinegraphic valign="middle" fileref="layout-rltb.png" format="PNG"></inlinegraphic>
 ;~ * @GTK_NUMBER_UP_LAYOUT_RIGHT_TO_LEFT_BOTTOM_TO_TOP: <inlinegraphic valign="middle" fileref="layout-rlbt.png" format="PNG"></inlinegraphic>
 ;~ * @GTK_NUMBER_UP_LAYOUT_TOP_TO_BOTTOM_LEFT_TO_RIGHT: <inlinegraphic valign="middle" fileref="layout-tblr.png" format="PNG"></inlinegraphic>
 ;~ * @GTK_NUMBER_UP_LAYOUT_TOP_TO_BOTTOM_RIGHT_TO_LEFT: <inlinegraphic valign="middle" fileref="layout-tbrl.png" format="PNG"></inlinegraphic>
 ;~ * @GTK_NUMBER_UP_LAYOUT_BOTTOM_TO_TOP_LEFT_TO_RIGHT: <inlinegraphic valign="middle" fileref="layout-btlr.png" format="PNG"></inlinegraphic>
 ;~ * @GTK_NUMBER_UP_LAYOUT_BOTTOM_TO_TOP_RIGHT_TO_LEFT: <inlinegraphic valign="middle" fileref="layout-btrl.png" format="PNG"></inlinegraphic>
 ;~ *
 ;~ * Used to determine the layout of pages on a sheet when printing
 ;~ * multiple pages per sheet.
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_NUMBER_UP_LAYOUT_LEFT_TO_RIGHT_TOP_TO_BOTTOM, /*< nick=lrtb >*/
  ;~ GTK_NUMBER_UP_LAYOUT_LEFT_TO_RIGHT_BOTTOM_TO_TOP, /*< nick=lrbt >*/
  ;~ GTK_NUMBER_UP_LAYOUT_RIGHT_TO_LEFT_TOP_TO_BOTTOM, /*< nick=rltb >*/
  ;~ GTK_NUMBER_UP_LAYOUT_RIGHT_TO_LEFT_BOTTOM_TO_TOP, /*< nick=rlbt >*/
  ;~ GTK_NUMBER_UP_LAYOUT_TOP_TO_BOTTOM_LEFT_TO_RIGHT, /*< nick=tblr >*/
  ;~ GTK_NUMBER_UP_LAYOUT_TOP_TO_BOTTOM_RIGHT_TO_LEFT, /*< nick=tbrl >*/
  ;~ GTK_NUMBER_UP_LAYOUT_BOTTOM_TO_TOP_LEFT_TO_RIGHT, /*< nick=btlr >*/
  ;~ GTK_NUMBER_UP_LAYOUT_BOTTOM_TO_TOP_RIGHT_TO_LEFT  /*< nick=btrl >*/
;~ } GtkNumberUpLayout;
;~ 
;~ typedef enum
;~ {
  ;~ GTK_PAGE_ORIENTATION_PORTRAIT,
  ;~ GTK_PAGE_ORIENTATION_LANDSCAPE,
  ;~ GTK_PAGE_ORIENTATION_REVERSE_PORTRAIT,
  ;~ GTK_PAGE_ORIENTATION_REVERSE_LANDSCAPE
;~ } GtkPageOrientation;
;~ 
;~ typedef enum
;~ {
  ;~ GTK_PRINT_QUALITY_LOW,
  ;~ GTK_PRINT_QUALITY_NORMAL,
  ;~ GTK_PRINT_QUALITY_HIGH,
  ;~ GTK_PRINT_QUALITY_DRAFT
;~ } GtkPrintQuality;
;~ 
;~ typedef enum
;~ {
  ;~ GTK_PRINT_DUPLEX_SIMPLEX,
  ;~ GTK_PRINT_DUPLEX_HORIZONTAL,
  ;~ GTK_PRINT_DUPLEX_VERTICAL
;~ } GtkPrintDuplex;
;~ 
;~ 
;~ typedef enum
;~ {
  ;~ GTK_UNIT_PIXEL,
  ;~ GTK_UNIT_POINTS,
  ;~ GTK_UNIT_INCH,
  ;~ GTK_UNIT_MM
;~ } GtkUnit;
;~ 
;~ /**
 ;~ * GtkTreeViewGridLines:
 ;~ * @GTK_TREE_VIEW_GRID_LINES_NONE: No grid lines.
 ;~ * @GTK_TREE_VIEW_GRID_LINES_HORIZONTAL: Horizontal grid lines.
 ;~ * @GTK_TREE_VIEW_GRID_LINES_VERTICAL: Vertical grid lines.
 ;~ * @GTK_TREE_VIEW_GRID_LINES_BOTH: Horizontal and vertical grid lines.
 ;~ *
 ;~ * Used to indicate which grid lines to draw in a tree view.
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_TREE_VIEW_GRID_LINES_NONE,
  ;~ GTK_TREE_VIEW_GRID_LINES_HORIZONTAL,
  ;~ GTK_TREE_VIEW_GRID_LINES_VERTICAL,
  ;~ GTK_TREE_VIEW_GRID_LINES_BOTH
;~ } GtkTreeViewGridLines;
;~ 
;~ /**
 ;~ * GtkDragResult:
 ;~ * @GTK_DRAG_RESULT_SUCCESS: The drag operation was successful.
 ;~ * @GTK_DRAG_RESULT_NO_TARGET: No suitable drag target.
 ;~ * @GTK_DRAG_RESULT_USER_CANCELLED: The user cancelled the drag operation.
 ;~ * @GTK_DRAG_RESULT_TIMEOUT_EXPIRED: The drag operation timed out.
 ;~ * @GTK_DRAG_RESULT_GRAB_BROKEN: The pointer or keyboard grab used
 ;~ *  for the drag operation was broken.
 ;~ * @GTK_DRAG_RESULT_ERROR: The drag operation failed due to some
 ;~ *  unspecified error.
 ;~ *
 ;~ * Gives an indication why a drag operation failed.
 ;~ * The value can by obtained by connecting to the
 ;~ * #GtkWidget::drag-failed signal.
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_DRAG_RESULT_SUCCESS,
  ;~ GTK_DRAG_RESULT_NO_TARGET,
  ;~ GTK_DRAG_RESULT_USER_CANCELLED,
  ;~ GTK_DRAG_RESULT_TIMEOUT_EXPIRED,
  ;~ GTK_DRAG_RESULT_GRAB_BROKEN,
  ;~ GTK_DRAG_RESULT_ERROR
;~ } GtkDragResult;
;~ 
;~ /**
 ;~ * GtkSizeRequestMode:
 ;~ * @GTK_SIZE_REQUEST_HEIGHT_FOR_WIDTH: Prefer height-for-width geometry management
 ;~ * @GTK_SIZE_REQUEST_WIDTH_FOR_HEIGHT: Prefer width-for-height geometry management
 ;~ * @GTK_SIZE_REQUEST_CONSTANT_SIZE: Dont trade height-for-width or width-for-height
 ;~ * 
 ;~ * Specifies a preference for height-for-width or
 ;~ * width-for-height geometry management.
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_SIZE_REQUEST_HEIGHT_FOR_WIDTH = 0,
  ;~ GTK_SIZE_REQUEST_WIDTH_FOR_HEIGHT,
  ;~ GTK_SIZE_REQUEST_CONSTANT_SIZE
;~ } GtkSizeRequestMode;
;~ 
;~ /**
 ;~ * GtkScrollablePolicy:
 ;~ * @GTK_SCROLL_MINIMUM: Scrollable adjustments are based on the minimum size
 ;~ * @GTK_SCROLL_NATURAL: Scrollable adjustments are based on the natural size
 ;~ *
 ;~ * Defines the policy to be used in a scrollable widget when updating
 ;~ * the scrolled window adjustments in a given orientation.
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_SCROLL_MINIMUM = 0,
  ;~ GTK_SCROLL_NATURAL
;~ } GtkScrollablePolicy;
;~ 
;~ /**
 ;~ * GtkStateFlags:
 ;~ * @GTK_STATE_FLAG_NORMAL: State during normal operation.
 ;~ * @GTK_STATE_FLAG_ACTIVE: Widget is active.
 ;~ * @GTK_STATE_FLAG_PRELIGHT: Widget has a mouse pointer over it.
 ;~ * @GTK_STATE_FLAG_SELECTED: Widget is selected.
 ;~ * @GTK_STATE_FLAG_INSENSITIVE: Widget is insensitive.
 ;~ * @GTK_STATE_FLAG_INCONSISTENT: Widget is inconsistent.
 ;~ * @GTK_STATE_FLAG_FOCUSED: Widget has the keyboard focus.
 ;~ * @GTK_STATE_FLAG_BACKDROP: Widget is in a background toplevel window.
 ;~ *
 ;~ * Describes a widget state.
 ;~ */
;~ typedef enum
;~ {
  ;~ GTK_STATE_FLAG_NORMAL       = 0,
  ;~ GTK_STATE_FLAG_ACTIVE       = 1 << 0,
  ;~ GTK_STATE_FLAG_PRELIGHT     = 1 << 1,
  ;~ GTK_STATE_FLAG_SELECTED     = 1 << 2,
  ;~ GTK_STATE_FLAG_INSENSITIVE  = 1 << 3,
  ;~ GTK_STATE_FLAG_INCONSISTENT = 1 << 4,
  ;~ GTK_STATE_FLAG_FOCUSED      = 1 << 5,
  ;~ GTK_STATE_FLAG_BACKDROP     = 1 << 6
;~ } GtkStateFlags;
;~ 
;~ /**
 ;~ * GtkRegionFlags:
 ;~ * @GTK_REGION_EVEN: Region has an even number within a set.
 ;~ * @GTK_REGION_ODD: Region has an odd number within a set.
 ;~ * @GTK_REGION_FIRST: Region is the first one within a set.
 ;~ * @GTK_REGION_LAST: Region is the last one within a set.
 ;~ * @GTK_REGION_ONLY: Region is the only one within a set.
 ;~ * @GTK_REGION_SORTED: Region is part of a sorted area.
 ;~ *
 ;~ * Describes a region within a widget.
 ;~ */
;~ typedef enum {
  ;~ GTK_REGION_EVEN    = 1 << 0,
  ;~ GTK_REGION_ODD     = 1 << 1,
  ;~ GTK_REGION_FIRST   = 1 << 2,
  ;~ GTK_REGION_LAST    = 1 << 3,
  ;~ GTK_REGION_ONLY    = 1 << 4,
  ;~ GTK_REGION_SORTED  = 1 << 5
;~ } GtkRegionFlags;
;~ 
;~ /**
 ;~ * GtkJunctionSides:
 ;~ * @GTK_JUNCTION_NONE: No junctions.
 ;~ * @GTK_JUNCTION_CORNER_TOPLEFT: Element connects on the top-left corner.
 ;~ * @GTK_JUNCTION_CORNER_TOPRIGHT: Element connects on the top-right corner.
 ;~ * @GTK_JUNCTION_CORNER_BOTTOMLEFT: Element connects on the bottom-left corner.
 ;~ * @GTK_JUNCTION_CORNER_BOTTOMRIGHT: Element connects on the bottom-right corner.
 ;~ * @GTK_JUNCTION_TOP: Element connects on the top side.
 ;~ * @GTK_JUNCTION_BOTTOM: Element connects on the bottom side.
 ;~ * @GTK_JUNCTION_LEFT: Element connects on the left side.
 ;~ * @GTK_JUNCTION_RIGHT: Element connects on the right side.
 ;~ *
 ;~ * Describes how a rendered element connects to adjacent elements.
 ;~ */
;~ typedef enum {
  ;~ GTK_JUNCTION_NONE   = 0,
  ;~ GTK_JUNCTION_CORNER_TOPLEFT = 1 << 0,
  ;~ GTK_JUNCTION_CORNER_TOPRIGHT = 1 << 1,
  ;~ GTK_JUNCTION_CORNER_BOTTOMLEFT = 1 << 2,
  ;~ GTK_JUNCTION_CORNER_BOTTOMRIGHT = 1 << 3,
  ;~ GTK_JUNCTION_TOP    = (GTK_JUNCTION_CORNER_TOPLEFT | GTK_JUNCTION_CORNER_TOPRIGHT),
  ;~ GTK_JUNCTION_BOTTOM = (GTK_JUNCTION_CORNER_BOTTOMLEFT | GTK_JUNCTION_CORNER_BOTTOMRIGHT),
  ;~ GTK_JUNCTION_LEFT   = (GTK_JUNCTION_CORNER_TOPLEFT | GTK_JUNCTION_CORNER_BOTTOMLEFT),
  ;~ GTK_JUNCTION_RIGHT  = (GTK_JUNCTION_CORNER_TOPRIGHT | GTK_JUNCTION_CORNER_BOTTOMRIGHT)
;~ } GtkJunctionSides;
;~ 
;~ /**
 ;~ * GtkBorderStyle:
 ;~ * @GTK_BORDER_STYLE_NONE: No visible border
 ;~ * @GTK_BORDER_STYLE_SOLID: A single line segment
 ;~ * @GTK_BORDER_STYLE_INSET: Looks as if the content is sunken into the canvas
 ;~ * @GTK_BORDER_STYLE_OUTSET: Looks as if the content is coming out of the canvas
 ;~ * @GTK_BORDER_STYLE_HIDDEN: Same as @GTK_BORDER_STYLE_NONE
 ;~ * @GTK_BORDER_STYLE_DOTTED: A series of round dots
 ;~ * @GTK_BORDER_STYLE_DASHED: A series of square-ended dashes
 ;~ * @GTK_BORDER_STYLE_DOUBLE: Two parrallel lines with some space between them
 ;~ * @GTK_BORDER_STYLE_GROOVE: Looks as if it were carved in the canvas
 ;~ * @GTK_BORDER_STYLE_RIDGE: Looks as if it were coming out of the canvas
 ;~ *
 ;~ * Describes how the border of a UI element should be rendered.
 ;~ */
;~ typedef enum {
  ;~ GTK_BORDER_STYLE_NONE,
  ;~ GTK_BORDER_STYLE_SOLID,
  ;~ GTK_BORDER_STYLE_INSET,
  ;~ GTK_BORDER_STYLE_OUTSET,
  ;~ GTK_BORDER_STYLE_HIDDEN,
  ;~ GTK_BORDER_STYLE_DOTTED,
  ;~ GTK_BORDER_STYLE_DASHED,
  ;~ GTK_BORDER_STYLE_DOUBLE,
  ;~ GTK_BORDER_STYLE_GROOVE,
  ;~ GTK_BORDER_STYLE_RIDGE
;~ } GtkBorderStyle;
;~ 
;~ G_END_DECLS
;~ 
;~ 
;~ #endif /* __GTK_ENUMS_H__ */
