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

/**
 * Class TwitterCard
 */
class TwitterCard extends Module
{
    const TWITTER_NAME = 'TWITTERCARD_TWITTERNAME';
    const HOME_PAGE_TITLE = 'TWITTERCARD_TWITTERHOMETITLE';
    const HOME_PAGE_DESCRIPTION = 'TWITTERCARD_TWITTERHOMEDESC';
    const HOME_PAGE_IMAGE = 'TWITTERCARD_TWITTERHOMEIMAGE';
    const HOME_PAGE_LOGO_URL = 'TWITTERCARD_TWITTERHOMEIMAGEURL';

    /**
     * TwitterCard constructor.
     */
    public function __construct()
    {
        parent::__construct();

        $this->name = 'twittercard';
        $this->tab = 'front_office_features';

        $this->version = '1.0.0';
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
        $success = parent::install();

        if (!$success) {
            parent::uninstall();

            return false;
        }

        $this->_clearCache('twittercard.tpl');

        $success &= $this->registerHook('header');

        return $success;
    }

    /**
     * Uninstall the module
     *
     * @return bool Whether the module has been succesfully uninstalled
     */
    public function uninstall()
    {
        $this->_clearCache('twittercard.tpl');

        Configuration::deleteByName(self::TWITTER_NAME);
        Configuration::deleteByName(self::HOME_PAGE_TITLE);
        Configuration::deleteByName(self::HOME_PAGE_DESCRIPTION);
        Configuration::deleteByName(self::HOME_PAGE_IMAGE);
        Configuration::deleteByName(self::HOME_PAGE_LOGO_URL);

        return parent::uninstall();
    }

    /**
     * Hook to the FO pages' <HEAD></HEAD> tags
     *
     * @param array $params Hook parameters
     * @return string Hook HTML
     */
    public function hookHeader($params)
    {
        $link = $this->context->link;
        $smarty = $this->context->smarty;
        $cookie = $this->context->cookie;
        $currentPage = get_class($this->context->controller);
        if ("ProductController" == $currentPage) {
            $cover = Product::getCover(intval(Tools::getValue('id_product')));
            $productInfo = Product::getCover(intval(Tools::getValue('id_product')));
            $product = new Product(Tools::getValue('id_product'), false, (int) $cookie->id_lang);
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

    /**
     * Get the module's configuration page
     *
     * @return string Configuration page HTML
     */
    public function getContent()
    {
        $output = '';

        if (Tools::isSubmit('submit'.$this->name)) {
            $output .= $this->postProcess();
        }

        return $output.$this->displayForm();
    }

    /**
     *  Configuration Page: display form
     */
    public function displayForm()
    {
        // Get default language
        $defaultLang = (int) Configuration::get('PS_LANG_DEFAULT');

        $helper = new HelperForm();

        // Module, token and currentIndex
        $helper->module = $this;
        $helper->name_controller = $this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');
        $helper->currentIndex = AdminController::$currentIndex.'&configure='.$this->name;

        // Language
        $helper->default_form_language = $defaultLang;
        $helper->allow_employee_form_lang = $defaultLang;

        // Title and toolbar
        $helper->title = $this->displayName;
        $helper->show_toolbar = true;
        $helper->toolbar_scroll = true;
        $helper->submit_action = 'submit'.$this->name;
        $helper->toolbar_btn = array(
            'save' =>
                array(
                    'desc' => $this->l('Save'),
                    'href' => AdminController::$currentIndex.'&configure='.$this->name.'&save'.$this->name.
                        '&token='.Tools::getAdminTokenLite('AdminModules'),
                ),
                'back' => array(
                    'href' => AdminController::$currentIndex.'&token='.Tools::getAdminTokenLite('AdminModules'),
                     'desc' => $this->l('Back to list'),
                ),
            );
        $helper->fields_value = $this->getFormValues();


        return $helper->generateForm(array($this->getTwitterCardForm()));
    }

    /**
     * Get the Twitter Card form
     *
     * @return array Form structure
     */
    protected function getTwitterCardForm()
    {
        return array(
            'form' => array(
                'legend' => array(
                    'title' => $this->l('Twitter Card Configuration'),
                    'icon' => 'icon-cogs',
                ),
                'description' => sprintf($this->l('You can test your Twitter Cards %shere.%s'), '<a href="https://dev.twitter.com/docs/cards/validation/validator" target="_blank">', '</a>'),
                'input' => array(
                    array(
                        'type' => 'text',
                        'label' => $this->l('Twitter name (ex. @strikehawkecomm)'),
                        'name' => self::TWITTER_NAME,
                        'required' => true,
                    ),
                    array(
                        'type' => 'text',
                        'label' => $this->l('Home Page Title'),
                        'name' => self::HOME_PAGE_TITLE,
                        'required' => true,
                    ),
                    array(
                        'type' => 'textarea',
                        'label' => $this->l('Home Page Description (limit: 200 chars)'),
                        'name' => self::HOME_PAGE_DESCRIPTION,
                        'required' => true,
                    ),
                    array(
                        'type' => 'switch',
                        'label' => $this->l('Home page image'),
                        'name' => self::HOME_PAGE_IMAGE,
                        'is_bool' => true,
                        'values' => array(
                            array(
                                'id' => 'active_on',
                                'value' => true,
                                'label' => $this->l('Yes'),
                            ),
                            array(
                                'id' => 'active_off',
                                'value' => false,
                                'label' => $this->l('No'),
                            ),
                        ),
                    ),
                    array(
                        'type' => 'text',
                        'label' => $this->l('Enter the logo URL'),
                        'name' => self::HOME_PAGE_LOGO_URL,
                        'required' => true,
                    ),
                ),
                'submit' => array(
                    'title' => $this->l('Save'),
                ),
            ),
        );
    }

    /**
     * Get form values
     *
     * @return array Form values
     */
    protected function getFormValues()
    {
        return array(
            self::TWITTER_NAME => Configuration::get(self::TWITTER_NAME),
            self::HOME_PAGE_TITLE => Configuration::get(self::HOME_PAGE_TITLE),
            self::HOME_PAGE_DESCRIPTION => Configuration::get(self::HOME_PAGE_DESCRIPTION),
            self::HOME_PAGE_IMAGE => Configuration::get(self::HOME_PAGE_IMAGE),
            self::HOME_PAGE_LOGO_URL => Configuration::get(self::HOME_PAGE_LOGO_URL),
        );
    }

    /**
     * Post process configuration form
     */
    protected function postProcess()
    {
        $success = true;
        foreach ($this->getFormValues() as $key => $value) {
            if (Tools::isSubmit($key)) {
                if (!Configuration::updateValue($key, Tools::getValue($key))) {
                    $success = false;
                }
            }
        }
        if ($success) {
            return $this->displayConfirmation($this->l('Form successfully updated'));
        }

        return $this->displayError($this->l('There was a problem while updating the configuration'));
    }
}
