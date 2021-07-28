" clear cache so this reloads changes.
" useful for development
lua package.loaded['githubdark'] = nil
lua package.loaded['githubdark.theme'] = nil
lua package.loaded['githubdark.colors'] = nil
lua package.loaded['githubdark.util'] = nil
lua package.loaded['githubdark.config'] = nil

lua require('githubdark').colorscheme()
