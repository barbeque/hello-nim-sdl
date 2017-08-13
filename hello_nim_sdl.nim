import sdl2, sdl2/gfx

discard sdl2.init(INIT_EVERYTHING)

var
  window: WindowPtr
  render: RendererPtr

window = createWindow("SDL Skeleton", 100, 100, 640, 480, SDL_WINDOW_SHOWN)
render = createRenderer(window, -1, Renderer_Accelerated or Renderer_PresentVsync or Renderer_TargetTexture)

var
  evt = sdl2.defaultEvent
  running = true
  fps: FpsManager
fps.init

while running:
  while pollEvent(evt):
    if evt.kind == QuitEvent:
      running = false
      break

  let delta = fps.getFramerate() / 1000

  render.setDrawColor 0,0,0,255
  render.clear

  render.present
  fps.delay

destroy render
destroy window
