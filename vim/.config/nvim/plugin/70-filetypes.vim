filetype plugin indent on

" Special overrides for specific filetypes
autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab " based on https://github.com/rwaldron/idiomatic.js#whitespace
autocmd FileType php        setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab " based on http://www.php-fig.org/psr/psr-2/#indenting
autocmd FileType python     setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab " based on https://www.python.org/dev/peps/pep-0008/#indentation
autocmd FileType yaml       setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab " based on http://yaml.org/spec/1.2/2009-07-21/spec.html#id2576668
