select
    d.txSignature,
    d.userAction,
    d.userAddress,
    d.timestamp,
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
        (pc.deposited_asset = 'SOL' and d.amount >= 500) or
        (pc.deposited_asset = 'mSOL' and d.amount >= 500) or
        (pc.deposited_asset = 'stSOL' and d.amount >= 500) or
        (pc.deposited_asset = 'scnSOL' and d.amount >= 500) or
        (pc.deposited_asset = 'ETH' and d.amount >= 16) or
        (pc.deposited_asset = 'BTC' and d.amount >= 1) or
        (pc.deposited_asset = 'USDC' and d.amount >= 50000) or
        (pc.deposited_asset = 'tsUSDC' and d.amount >= 50000) or
        (pc.deposited_asset = 'FTT' and d.amount >= 1000) or 
        (pc.deposited_asset = 'LUNA' and d.amount >= 500) or
        (pc.deposited_asset = 'SRM' and d.amount >= 20000) or 
        (pc.deposited_asset = 'MNGO' and d.amount >= 500000) or
        (pc.deposited_asset = 'STEP' and d.amount >= 500000) or 
        (pc.deposited_asset = 'SBR' and d.amount >= 2500000) or 
        (pc.deposited_asset = 'RAY' and d.amount >= 20000) or 
        (pc.deposited_asset = 'AVAX' and d.amount >= 625)
    ) and
    timestamp(d.timestamp) between timestamp_add(current_timestamp(), INTERVAL -1 HOUR) and current_timestamp() 


union all


select
    w.txSignature,
    w.userAction,
    w.userAddress,
    w.timestamp,
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
        (pc.deposited_asset = 'SOL' and w.amount >= 500) or
        (pc.deposited_asset = 'mSOL' and w.amount >= 500) or
        (pc.deposited_asset = 'stSOL' and w.amount >= 500) or
        (pc.deposited_asset = 'scnSOL' and w.amount >= 500) or
        (pc.deposited_asset = 'ETH' and w.amount >= 16) or
        (pc.deposited_asset = 'BTC' and w.amount >= 1) or
        (pc.deposited_asset = 'USDC' and w.amount >= 50000) or
        (pc.deposited_asset = 'tsUSDC' and w.amount >= 50000) or
        (pc.deposited_asset = 'FTT' and w.amount >= 1000) or 
        (pc.deposited_asset = 'LUNA' and w.amount >= 500) or
        (pc.deposited_asset = 'SRM' and w.amount >= 20000) or 
        (pc.deposited_asset = 'MNGO' and w.amount >= 500000) or
        (pc.deposited_asset = 'STEP' and w.amount >= 500000) or 
        (pc.deposited_asset = 'SBR' and w.amount >= 2500000) or 
        (pc.deposited_asset = 'RAY' and w.amount >= 20000) or 
        (pc.deposited_asset = 'AVAX' and w.amount >= 625)
    ) and
    timestamp(w.timestamp) between timestamp_add(current_timestamp(), INTERVAL -1 HOUR) and current_timestamp() 