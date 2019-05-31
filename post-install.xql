xquery version "3.1";

let $base := '/db/MUK-data'
let $base-collection := if (xmldb:collection-available(concat($base,'/demojam')))
                        then (concat($base,'/demojam'))
                        else (xmldb:create-collection($base,'demojam'))

let $presenters := <presenters/>

let $presenters := if (doc-available(concat($base-collection,'presenters.xml'))) then () else (xmldb:store($base-collection,'presenters.xml',$presenters))

return (
    $presenters
)

