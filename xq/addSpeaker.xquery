xquery version "3.1";

let $login := xmldb:login('/db','admin','Favorit70')
let $dateTime := current-dateTime()
let $base := '/db/test/demojam/'
let $base-collection := if (xmldb:collection-available($base)) then () else (xmldb:create-collection('/',$base))

let $presenters := if (doc-available('/db/test/demojam/presenters.xml'))
                        then ('/db/test/demojam/presenters.xml')
                        else (xmldb:store($base,'presenters.xml',<presenters></presenters>))

let $speaker := request:get-data()/person

let $update := update insert $speaker into doc($presenters)/presenters

let $count := concat(count(doc($presenters)//person),' presenter(s): ')
let $list := for $person in doc($presenters)//person
    let $current := concat($person/name,' (',$person/title,')')
    let $comma := if ($person[following-sibling::person]) then (', ') else ()
    return concat($current,$comma)

return ($count,$list)


