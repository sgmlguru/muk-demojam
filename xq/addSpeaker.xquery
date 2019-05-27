xquery version "3.1";

let $login := xmldb:login('/db','admin','Favorit70')
let $dateTime := current-dateTime()
let $base := '/db/MUK-data'
let $base-collection := if (xmldb:collection-available(concat($base,'/demojam')))
                        then ()
                        else (xmldb:create-collection($base,'demojam'))

let $presenters := if (doc-available(concat($base,'/demojam/presenters.xml')))
                        then (concat($base,'/demojam/presenters.xml'))
                        else (xmldb:store(concat($base,'/demojam'),'presenters.xml',<presenters></presenters>))

let $speaker := request:get-data()/person

let $registered := count(doc($presenters)//person)

let $max := 10

let $update := if ($registered < $max) 
               then (update insert $speaker into doc($presenters)/presenters)
               else ('Max number of speakers reached')

let $count := concat(count(doc($presenters)//person),' presenter(s): ')

let $list := for $person in doc($presenters)//person
    let $current := concat($person/name,' (',$person/title,')')
    let $comma := if ($person[following-sibling::person]) then (', ') else ()
    return concat($current,$comma)

return ($count,$list)


