xquery version "3.1";

(:let $myvote := 'Presentation 3':)

let $login := xmldb:login('/db','admin','Favorit70')

let $myvote := request:get-data()

let $presenters := '../resources/xml/presenters.xml'
let $doc := doc($presenters)
let $current-count := doc($presenters)//person[title=$myvote]/@votes
let $update := update value $doc//person[title=$myvote]/@votes with $current-count + 1

return <message>Thank you for voting!</message>