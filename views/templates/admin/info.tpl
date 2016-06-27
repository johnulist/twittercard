{*
 * Copyright (C) StrikeHawk eCommerce, Inc. - All Rights Reserved
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 *
 * @author    StrikeHawk eCommerce, Inc. <sales@services.strikehawk.com>
 * @copyright 2016 StrikeHawk eCommerce, Inc.
 * @license   proprietary
 * Intellectual Property of StrikeHawk eCommerce, Inc.
*}
{if $input.type == 'switch' && $smarty.const._PS_VERSION_|@addcslashes:'\'' < '1.6'}
	<fieldset>
		<legend>
			{l s='Twitter cards' mod='twittercard'}
		</legend>
		<p>
			{l s='Module info'}
			<br>
		</p>
	</fieldset>
{else}
	<div class="panel">
		<h3><i class="icon icon-puzzle-piece"></i> {l s='Twitter cards' mod='twittercard'}</h3>
		<p>
			{l s='Module info' mod='twittercard'}
		</p>
	</div>
{/if}