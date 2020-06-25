```
# locks
pg_locks_count

# db size
sum(pg_database_size{datname='$datname'})

# vacuum
(time() - pg_stat_user_tables_last_autovacuum) > 0
(time() - pg_stat_user_tables_last_vacuum) > 0

# seq/idx scan
sum(rate(pg_stat_user_tables_idx_scan{}[1m]) > 0)
sum(rate(pg_stat_user_tables_seq_scan[1m]) > 0)

# estimated number of live rows
topk(10, pg_stat_user_tables_n_live_tup)

# returned/fetched
sum(rate(pg_stat_database_tup_fetched{datname="$datname"}[1m]))
sum(rate(pg_stat_database_tup_returned{datname="$datname"}[1m]))

# transations that have been commited/rollbacked
rate(pg_stat_database_xact_commit{datname="$datname"}[1m])
rate(pg_stat_database_xact_rollback{datname="$datname"}[1m])

# rate of rows
rate(pg_stat_user_tables_n_tup_ins{}[1m]) > 0
rate(pg_stat_user_tables_n_tup_upd[1m]) > 0
rate(pg_stat_user_tables_n_tup_hot_upd[1m]) > 0
rate(pg_stat_user_tables_n_tup_del[1m]) > 0

# active connections
pg_stat_database_numbackends{datname='$datname'}
```
