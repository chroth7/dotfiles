fun! MyFirstPlugin()
  " dont forget to remove this one....
  lua for k in pairs(package.loaded) do if k:match("^myFirstPlugin") then package.loaded[k] = nil end end
  lua require("myFirstPlugin").createFloatingWindow()
endfun

let g:my_first_plugin_value = 42
augroup MyFirstPlugin
  autocmd!
  autocmd VimResized * :lua require("myFirstPlugin").onResize()
augroup END
