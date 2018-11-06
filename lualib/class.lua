-- a minimal class implementation
-- 一个精简版的类实现
function class(cls_name)
    local cls = { }
    cls.__index = cls
    cls.__name = cls_name
    function cls.__call(cls, ...)
        if cls[__name] then
            return cls[__name](cls, ...)
        end
        return nil
    end
    function cls.new(cls, ...)
        if not cls then
            print("[class.lua] Please use ':' to index (new) method :)")
            return
        end
        cls.ctor(cls, ...)
        return setmetatable({}, cls)
    end
    return cls
end

return class