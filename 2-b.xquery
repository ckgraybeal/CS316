<result>{
for $i in /site/regions/*/item
where $i/incategory[@category = "category2"]
return
  <item>
     {$i/name}
  </item>
}
</result>
