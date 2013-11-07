<result>{
for $t in /Zthes/term
return
   <term id="term-{$t/termId}" name="{$t/termName}" type="{$t/termType}">{
      for $r in $t/relation
      return <relation type="{$r/relationType}" term="term-{$r/termId}"/>
   }
   </term>
}
</result>

