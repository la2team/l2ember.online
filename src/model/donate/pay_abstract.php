<?php

namespace Ofey\Logan22\model\donate;

class pay_abstract {

    /**
     * Используется для определения конфигурации платежной системы
     *
     * @param   string  $methodName
     *
     * @return string|int
     * @throws \Exception
     */
    public static function getConfigValue(string $methodName): string|int
    {
        return \Ofey\Logan22\controller\config\config::load()->donate()->get(get_called_class())->getInput($methodName);
    }

    public static function getDescription(): ?array {
        return static::$description ?? null;
    }

    public static function isEnable(): bool{
        return static::$enable;
    }

    public static function forAdmin(): bool{
        return static::$forAdmin;
    }
}