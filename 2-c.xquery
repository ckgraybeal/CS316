<result>{
for $p in /site/people/person
where $p/address/zipcode = 27
return
  <person>
     {$p/name}
  </person>
}
</result>
