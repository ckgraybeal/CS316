<result>{
for $oa in /site/open_auctions/open_auction
let $i := /site/regions/*/id($oa/itemref/@item)
let $p := /site/people/id($oa/bidder/personref/@person)
where $i/name[contains(., 'cow')]
return
<biddername>
  {$p/name}
</biddername>
}

</result>

