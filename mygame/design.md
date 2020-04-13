

```mermaid
classDiagram
    class UI
    UI : Color Theme
    UI : Collapsed_size
    UI : render_sidebar(collapsed_size)
    UI : render_bottombar(collapsed_size)
    UI : render_topbar(collapsed_size)
    UI : render_gamewindow(collapsed_size)

    UI <-- Sidebar
    UI <-- Bottombar
    UI <-- Topbar
    UI <-- GameWindow

  class Sidebar
  Sidebar: size
  Sidebar: render_logo()
  Sidebar: render_buttons()

  class Bottombar
  Bottombar: size
  Bottombar: render_latest_info()
  
  class Topbar
  Topbar: size
  Topbar: render_username()
  Topbar: render_level()
  Topbar: render_coins()

  class GameWindow
  GameWindow: size
  GameWindow: render_screen()


```