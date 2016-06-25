<?php
/**
 * Copyright (C) StrikeHawk eCommerce, Inc. - All Rights Reserved
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 *
 * @author    StrikeHawk eCommerce, Inc. <sales@services.strikehawk.com>
 * @copyright 2016 StrikeHawk eCommerce, Inc.
 * @license   proprietary
 * Intellectual Property of StrikeHawk eCommerce, Inc.
 */

if (!defined('_PS_VERSION_')) {
    exit;
}

class TwitterCard extends Module
{
    public function __construct()
    {
        parent::__construct();

        $this->name = 'twittercard';
        $this->tab = 'front_office_features';

        $this->version = '1.0';
        $this->author = 'StrikeHawk eCommerce, Inc.';
        $this->displayName = $this->l('Twitter Summary With Large Image Card');
        $this->description = $this->l('Adds Twitter Summary Card with large image to your site');

        $this->bootstrap = true;
    }

    /**
     * Install the module
     *
     * @return bool Whether the module has been installed succesfully
     * @throws PrestaShopException
     */
    public function install()
    {
        $this->_clearCache('twittercard.tpl');

        return (parent::install()
            && Configuration::updateValue('twitterhandle', '')
            && Configuration::updateValue('hometitle', '')
            && Configuration::updateValue('homedesc', '')
            && Configuration::updateValue('homelogo', '')
            && Configuration::updateValue('homelogourl', '')
            && $this->registerHook('header'));
    }

    /**
     * Uninstall the module
     *
     * @return bool Whether the module has been succesfully uninstalled
     */
    public function uninstall()
    {
        $this->_clearCache('twittercard.tpl');

        return (
            !Configuration::deleteByName('twitterhandle') ||
            !Configuration::deleteByName('hometitle') ||
            !Configuration::deleteByName('homedesc') ||
            !Configuration::deleteByName('homelogo') ||
            !Configuration::deleteByName('homelogourl') ||
            parent::uninstall());
    }

    /**
     * Get the module's configuration page
     *
     * @return string Configuration page HTML
     */
    public function getContent()
    {
        $html = '';

        if (isset($_POST['submitModule'])) {
            Configuration::updateValue(
                'twitterhandle',
                ((isset($_POST['twitterhandle']) && $_POST['twitterhandle'] != '') ? $_POST['twitterhandle'] : ''),
                true
            );
            Configuration::updateValue('hometitle', Tools::getValue('hometitle'));
            Configuration::updateValue('homedesc', Tools::getValue('homedesc'));
            Configuration::updateValue('homelogo', Tools::getValue('homelogo'));
            Configuration::updateValue('homelogourl', Tools::getValue('homelogourl'));

            // FIXME: html not allowed here
            $html .= '<div class="confirm" style="height:40px;padding-left:40px;line-height:40px;">'.$this->l('Configuration updated').'</div>';
        }

        return $html.$this->display(__FILE__, 'getcontent.tpl');
    }

    /**
     * Hook to the FO pages' <HEAD></HEAD> tags
     *
     * @param array $params Hook parameters
     * @return string Hook HTML
     */
    public function hookHeader($params)
    {
        // FIXME: remove old 1.4 stuff
        global $smarty, $cookie, $link;
        $currentPage = get_class($this->context->controller);
        if ("ProductController" == $currentPage) {
            $cover = Product::getCover(intval(Tools::getValue('id_product')));
            $productInfo = Product::getCover(intval(Tools::getValue('id_product')));
            $product = new Product(Tools::getValue('id_product'), false, intval($cookie->id_lang));
            if (is_array($cover) && sizeof($cover) == 1) {
                $fbCover = '';
                $protocolLink = @$_SERVER['HTTPS'] == "on" ? "https://" : "http://";
                if ($idProduct = (int) Tools::getValue('id_product')) {
                    $product = new Product($idProduct, true, $this->context->language->id, $this->context->shop->id);
                }

                $twitterImage = $link->getImageLink(
                    $product->link_rewrite[$cookie->id_lang],
                    Tools::getValue('id_product').'-'.$cover['id_image'], 'thickbox_default'
                );
            }
        }

        // FIXME: remove old 1.4 stuff
        global $smarty;
        if ($currentPage == "ProductController") {
            $smarty->assign(
                array(
                    'twitter_site' => Configuration::get('twitterhandle'),
                    'twitter_product_name' => $product->name,
                    'twitter_description' => $product->description_short,
                    'twitter_image' => $twitterImage,
                    'twitter_image_alt' => $product->legend,
                    'twitter_price' => $product->price,
                )
            );
        } else {
            $smarty->assign(
                array(
                    'twitter_site' => Configuration::get('twitterhandle'),
                    'twitter_hometitle' => Configuration::get('hometitle'),
                    'twitter_homedesc' => Configuration::get('homedesc'),
                    'twitter_homelogo' => Configuration::get('homelogo'),
                    'twitter_homelogourl' => Configuration::get('homelogourl'),
                )
            );
        }

        return $this->display(__FILE__, 'twittercard.tpl', $this->getCacheId());
    }
}
