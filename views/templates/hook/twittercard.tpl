<!-- twitter card module -->
{if $page_name == 'product'}
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:site" content="{$twitter_site}">
<meta name="twitter:creator" content="{$twitter_site}">
<meta name="twitter:title" content="{$twitter_product_name|escape:'html':'UTF-8'} - ${$twitter_price} USD">
<meta name="twitter:description" content="{$twitter_description|strip_tags:'UTF-8'}">
<meta name="twitter:image" content="{$twitter_image}">
<meta name="twitter:image:alt" content="{$twitter_image_alt|escape:'text':'UTF-8'}"
{elseif $page_name == 'index'}
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:site" content="{$twitter_site}">
<meta name="twitter:creator" content="{$twitter_site}">
<meta name="twitter:title" content="{$twitter_hometitle}">
<meta name="twitter:description" content="{$twitter_homedesc}">
	{if $twitter_homelogo ==1}
<meta name="twitter:image" content="../img/logo.jpg">
	{else}
<meta name="twitter:image" content="{$twitter_homelogourl}">
<meta name="twitter:image:alt" content="{$twitter_homedesc}"
	{/if}
{/if}
<!-- twitter card module -->