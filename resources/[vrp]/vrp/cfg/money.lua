local cfg = {}

-- start wallet/bank values
cfg.open_wallet = 10000
cfg.open_bank = 50000

cfg.display_css = [[
.div_money{
  position: absolute;
  top: 140px;
  right: 10px;
  font-size: 30px;
  font-family: 'Franklin Gothic Demi Cond', sans-serif;
  color: #FFFFFF;
  text-shadow: rgb(0, 0, 0) 1px 0px 0px, rgb(0, 0, 0) 0.533333px 0.833333px 0px, rgb(0, 0, 0) -0.416667px 0.916667px 0px, rgb(0, 0, 0) -0.983333px 0.133333px 0px, rgb(0, 0, 0) -0.65px -0.75px 0px, rgb(0, 0, 0) 0.283333px -0.966667px 0px, rgb(0, 0, 0) 0.966667px -0.283333px 0px;
}
.div_money .symbol{
  font-size: 20px;
  color: #00ac51;
  content: url('https://i.imgur.com/wBqG5ZJ.png'); 
 
}
]]

return cfg