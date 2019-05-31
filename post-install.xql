xquery version "3.1";

let $base := '/db/apps/muk-demojam/resources'
let $base-collection := if (xmldb:collection-available(concat($base,'/xml')))
                        then (concat($base,'/xml'))
                        else (xmldb:create-collection($base,'xml'))

let $presenters := <presenters><person votes="0"><name/><title/></person></presenters>

let $presenters := if (doc-available(concat($base-collection,'presenters.xml'))) then () else (xmldb:store($base-collection,'presenters.xml',$presenters))

return (
    $presenters
)

