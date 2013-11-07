<result>{
for $ca in /site/closed_auctions/closed_auction
where $ca/price < 10
return
  <closed_auction>
     {$ca/buyer}
  </closed_auction>
}
</result>
