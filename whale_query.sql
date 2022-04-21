select
    d.userAction,
    d.userAddress,
    timestamp(d.timestamp) as timestamp,
    pc.product_name,
    pc.deposited_asset,
    pc.strategy,
    pc.volt_number,
    case when pc.is_high_voltage then 'High' else 'Low' end as voltage,
    d.amount
from solana.deposits d
    left join analytics.product_catalog pc on pc.globalId = d.globalId
where
    (
        (pc.deposited_asset = 'SOL' and d.amount >= 100) or
        (pc.deposited_asset = 'mSOL' and d.amount >= 100) or
        (pc.deposited_asset = 'stSOL' and d.amount >= 100) or
        (pc.deposited_asset = 'scnSOL' and d.amount >= 100) or
        (pc.deposited_asset = 'ETH' and d.amount >= 3) or
        (pc.deposited_asset = 'BTC' and d.amount >= 0.25) or
        (pc.deposited_asset = 'USDC' and d.amount >= 10000) or
        (pc.deposited_asset = 'tsUSDC' and d.amount >= 10000) or
        (pc.deposited_asset = 'FTT' and d.amount >= 250) or 
        (pc.deposited_asset = 'LUNA' and d.amount >= 100) or
        (pc.deposited_asset = 'SRM' and d.amount >= 4000) or 
        (pc.deposited_asset = 'MNGO' and d.amount >= 100000) or
        (pc.deposited_asset = 'STEP' and d.amount >= 100000) or 
        (pc.deposited_asset = 'SBR' and d.amount >= 500000) or 
        (pc.deposited_asset = 'RAY' and d.amount >= 4000) or 
        (pc.deposited_asset = 'AVAX' and d.amount >= 133)
    ) and
    timestamp(d.timestamp) between timestamp_add(current_timestamp(), INTERVAL -1 HOUR) and current_timestamp() 


union all


select
    w.userAction,
    w.userAddress,
    timestamp(w.timestamp) as timestamp,
    pc.product_name,
    pc.deposited_asset,
    pc.strategy,
    pc.volt_number,
    case when pc.is_high_voltage then 'High' else 'Low' end as voltage,
    w.amount
from solana.withdrawals w
    left join analytics.product_catalog pc on pc.globalId = w.globalId
where
    (
        (pc.deposited_asset = 'SOL' and w.amount >= 100) or
        (pc.deposited_asset = 'mSOL' and w.amount >= 100) or
        (pc.deposited_asset = 'stSOL' and w.amount >= 100) or
        (pc.deposited_asset = 'scnSOL' and w.amount >= 100) or
        (pc.deposited_asset = 'ETH' and w.amount >= 3) or
        (pc.deposited_asset = 'BTC' and w.amount >= 0.25) or
        (pc.deposited_asset = 'USDC' and w.amount >= 10000) or
        (pc.deposited_asset = 'tsUSDC' and w.amount >= 10000) or
        (pc.deposited_asset = 'FTT' and w.amount >= 250) or 
        (pc.deposited_asset = 'LUNA' and w.amount >= 100) or
        (pc.deposited_asset = 'SRM' and w.amount >= 4000) or 
        (pc.deposited_asset = 'MNGO' and w.amount >= 100000) or
        (pc.deposited_asset = 'STEP' and w.amount >= 100000) or 
        (pc.deposited_asset = 'SBR' and w.amount >= 500000) or 
        (pc.deposited_asset = 'RAY' and w.amount >= 4000) or 
        (pc.deposited_asset = 'AVAX' and w.amount >= 133)
    ) and
    timestamp(w.timestamp) between timestamp_add(current_timestamp(), INTERVAL -1 HOUR) and current_timestamp() 