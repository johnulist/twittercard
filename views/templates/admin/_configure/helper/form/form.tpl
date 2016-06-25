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
{extends file="helpers/form/form.tpl"}

{block name="input"}
	{if $input.type == 'switch' && $smarty.const._PS_VERSION_|@addcslashes:'\'' < '1.6'}
		{foreach $input.values as $value}
			<input type="radio" name="{$input.name|escape:'htmlall':'UTF-8'}"
				   id="{$input.name|escape:'htmlall':'UTF-8'}_{$value.id|escape:'htmlall':'UTF-8'}"
				   value="{$value.value|escape:'htmlall':'UTF-8'}"
				   {if $fields_value[$input.name] == $value.value}checked="checked"{/if}
					{if isset($input.disabled) && $input.disabled}disabled="disabled"{/if} />
			<label class="t" for="{$input.name|escape:'htmlall':'UTF-8'}_{$value.id|escape:'htmlall':'UTF-8'}">
				{if isset($input.is_bool) && $input.is_bool == true}
					{if $value.value == 1}
						<img src="../img/admin/enabled.gif" alt="{$value.label|escape:'htmlall':'UTF-8'}"
							 title="{$value.label|escape:'htmlall':'UTF-8'}" />
					{else}
						<img src="../img/admin/disabled.gif" alt="{$value.label|escape:'htmlall':'UTF-8'}"
							 title="{$value.label|escape:'htmlall':'UTF-8'}" />
					{/if}
				{else}
					{$value.label|escape:'htmlall':'UTF-8'}
				{/if}
			</label>
			{if isset($input.br) && $input.br}<br />{/if}
			{if isset($value.p) && $value.p}<p>{$value.p|escape:'htmlall':'UTF-8'}</p>{/if}
		{/foreach}
	{else}
		{$smarty.block.parent}
	{/if}
{/block}