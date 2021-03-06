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
        (pc.deposited_asset = 'SOL' and d.amount >= 1250) or
        (pc.deposited_asset = 'mSOL' and d.amount >= 1250) or
        (pc.deposited_asset = 'stSOL' and d.amount >= 1250) or
        (pc.deposited_asset = 'scnSOL' and d.amount >= 1250) or
        (pc.deposited_asset = 'ETH' and d.amount >= 25) or
        (pc.deposited_asset = 'BTC' and d.amount >= 2) or
        (pc.deposited_asset = 'USDC' and d.amount >= 50000) or
        (pc.deposited_asset = 'tsUSDC' and d.amount >= 50000) or
        (pc.deposited_asset = 'FTT' and d.amount >= 2000) or 
        (pc.deposited_asset = 'SRM' and d.amount >= 50000) or 
        (pc.deposited_asset = 'MNGO' and d.amount >= 1000000) or
        (pc.deposited_asset = 'STEP' and d.amount >= 1250000) or 
        (pc.deposited_asset = 'SBR' and d.amount >= 10000000) or 
        (pc.deposited_asset = 'RAY' and d.amount >= 50000) or 
        (pc.deposited_asset = 'AVAX' and d.amount >= 2000)
    ) and
    timestamp(d.timestamp) between timestamp_add(current_timestamp(), INTERVAL -1 HOUR) and current_timestamp() 


union all


select
    d.txSignature,
    case when d.userAction = 'CancelPendingDeposit' then 'Deposit Cancellation' end as userAction,
    d.userAddress,
    d.timestamp,
    pc.product_name,
    pc.deposited_asset,
    pc.strategy,
    pc.volt_number,
    case when pc.is_high_voltage then 'High' else 'Low' end as voltage,
    d.amount
from solana.deposits_cancel_pending d
    left join analytics.product_catalog pc on pc.globalId = d.globalId
where
    (
        (pc.deposited_asset = 'SOL' and d.amount >= 1250) or
        (pc.deposited_asset = 'mSOL' and d.amount >= 1250) or
        (pc.deposited_asset = 'stSOL' and d.amount >= 1250) or
        (pc.deposited_asset = 'scnSOL' and d.amount >= 1250) or
        (pc.deposited_asset = 'ETH' and d.amount >= 25) or
        (pc.deposited_asset = 'BTC' and d.amount >= 2) or
        (pc.deposited_asset = 'USDC' and d.amount >= 50000) or
        (pc.deposited_asset = 'tsUSDC' and d.amount >= 50000) or
        (pc.deposited_asset = 'FTT' and d.amount >= 2000) or 
        (pc.deposited_asset = 'SRM' and d.amount >= 50000) or 
        (pc.deposited_asset = 'MNGO' and d.amount >= 1000000) or
        (pc.deposited_asset = 'STEP' and d.amount >= 1250000) or 
        (pc.deposited_asset = 'SBR' and d.amount >= 10000000) or 
        (pc.deposited_asset = 'RAY' and d.amount >= 50000) or 
        (pc.deposited_asset = 'AVAX' and d.amount >= 2000)
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
        (pc.deposited_asset = 'SOL' and w.amount >= 1250) or
        (pc.deposited_asset = 'mSOL' and w.amount >= 1250) or
        (pc.deposited_asset = 'stSOL' and w.amount >= 1250) or
        (pc.deposited_asset = 'scnSOL' and w.amount >= 1250) or
        (pc.deposited_asset = 'ETH' and w.amount >= 25) or
        (pc.deposited_asset = 'BTC' and w.amount >= 2) or
        (pc.deposited_asset = 'USDC' and w.amount >= 50000) or
        (pc.deposited_asset = 'tsUSDC' and w.amount >= 50000) or
        (pc.deposited_asset = 'FTT' and w.amount >= 2000) or 
        (pc.deposited_asset = 'SRM' and w.amount >= 50000) or 
        (pc.deposited_asset = 'MNGO' and w.amount >= 1000000) or
        (pc.deposited_asset = 'STEP' and w.amount >= 1250000) or 
        (pc.deposited_asset = 'SBR' and w.amount >= 10000000) or 
        (pc.deposited_asset = 'RAY' and w.amount >= 50000) or 
        (pc.deposited_asset = 'AVAX' and w.amount >= 2000)
    ) and
    timestamp(w.timestamp) between timestamp_add(current_timestamp(), INTERVAL -1 HOUR) and current_timestamp()


union all


select
    w.txSignature,
    case when w.userAction = 'CancelPendingWithdrawal' then 'Withdrawal Cancellation' end as userAction,
    w.userAddress,
    w.timestamp,
    pc.product_name,
    pc.deposited_asset,
    pc.strategy,
    pc.volt_number,
    case when pc.is_high_voltage then 'High' else 'Low' end as voltage,
    w.amount
from solana.withdrawals_cancel_pending w
    left join analytics.product_catalog pc on pc.globalId = w.globalId
where
    (
        (pc.deposited_asset = 'SOL' and w.amount >= 1250) or
        (pc.deposited_asset = 'mSOL' and w.amount >= 1250) or
        (pc.deposited_asset = 'stSOL' and w.amount >= 1250) or
        (pc.deposited_asset = 'scnSOL' and w.amount >= 1250) or
        (pc.deposited_asset = 'ETH' and w.amount >= 25) or
        (pc.deposited_asset = 'BTC' and w.amount >= 2) or
        (pc.deposited_asset = 'USDC' and w.amount >= 50000) or
        (pc.deposited_asset = 'tsUSDC' and w.amount >= 50000) or
        (pc.deposited_asset = 'FTT' and w.amount >= 2000) or 
        (pc.deposited_asset = 'SRM' and w.amount >= 50000) or 
        (pc.deposited_asset = 'MNGO' and w.amount >= 1000000) or
        (pc.deposited_asset = 'STEP' and w.amount >= 1250000) or 
        (pc.deposited_asset = 'SBR' and w.amount >= 10000000) or 
        (pc.deposited_asset = 'RAY' and w.amount >= 50000) or 
        (pc.deposited_asset = 'AVAX' and w.amount >= 2000)
    ) and
    timestamp(w.timestamp) between timestamp_add(current_timestamp(), INTERVAL -1 HOUR) and current_timestamp() 