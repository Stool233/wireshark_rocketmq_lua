-- 声明协议
local NAME = "RocketMQ"
local PORTS = { 9876, 10911 }
local proto = Proto.new(NAME, "RocketMQ Protocol")

-- 声明 dissector 函数，处理包
function proto.dissector(tvb, pinfo, tree)
    print("load plugin...demo")
    pinfo.cols.protocol = proto.name;
    pinfo.cols.info = "Hello, World"
end

-- 注册 dissector 到 wireshark
for _, port in ipairs(PORTS) do
    DissectorTable.get("tcp.port"):add(port, proto)
end
