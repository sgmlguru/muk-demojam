xquery version "3.1";
declare namespace util="http://exist-db.org/xquery/util";

let $login := xmldb:login('/db','admin','Favorit70')
let $presenters := collection('/db/MUK-data/demojam')//person
return
    <presenters>
    {
    for $person in $presenters
        let $order := util:random()
        order by $order
        return $person
    }
    </presenters>