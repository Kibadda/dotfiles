Plug 'tpope/vim-projectionist'

let g:projectionist_heuristics = {
    \ "artisan": {
    \   "*": {
    \     "console": "php artisan tinker",
    \   },
    \   "app/Http/Controllers/*Controller.php": {
    \     "type": "source",
    \     "alternate": "tests/Feature/{}Test.php",
    \   },
    \   "tests/Feature/*Test.php": {
    \     "type": "test",
    \     "alternate": "app/Http/Controllers/{}Controller.php",
    \   },
    \   "app/Http/Resources/*Resource.php" : {
    \     "type": "source",
    \     "alternate": "tests/Unit/Resource/{}Test.php"
    \   },
    \   "tests/Unit/Resource/*Test.php": {
    \     "type": "test",
    \     "alternate": "app/Http/Resources/{}Resource.php",
    \   },
    \   "app/Http/Requests/*Request.php" : {
    \     "type": "source",
    \     "alternate": "tests/Unit/Requests/{}Test.php"
    \   },
    \   "tests/Unit/Requests/*Test.php": {
    \     "type": "test",
    \     "alternate": "app/Http/Requests/{}Request.php",
    \   },
    \   "app/Notifications/*Notification.php" : {
    \     "type": "source",
    \     "alternate": "tests/Unit/Notifications/{}Test.php"
    \   },
    \   "tests/Unit/Notifications/*Test.php": {
    \     "type": "test",
    \     "alternate": "app/Notifications/{}Notification.php",
    \   },
    \ }}
