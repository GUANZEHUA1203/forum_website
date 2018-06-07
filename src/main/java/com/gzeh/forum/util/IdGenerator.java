package com.gzeh.forum.util;

import java.util.logging.Level;

public class IdGenerator {

    private final long workerId;
    private final long epoch = 1403854494756L;
    private final long workerIdBits = 10L;
    private final long maxWorkerId;
    private long sequence;
    private final long sequenceBits;
    private final long workerIdShift;
    private final long timestampLeftShift;
    private final long sequenceMask;
    private long lastTimestamp;

    public IdGenerator(String workerIdStr) {
    	Long workerId=Long.parseLong(workerIdStr);
        this.getClass();
        this.maxWorkerId = ~(-1L << 10);
        this.sequence = 0L;
        this.sequenceBits = 12L;
        this.getClass();
        this.workerIdShift = 12L;
        this.getClass();
        this.getClass();
        this.timestampLeftShift = 12L + 10L;
        this.getClass();
        this.sequenceMask = ~(-1L << 12);
        this.lastTimestamp = -1L;
        if (workerId <= this.maxWorkerId && workerId >= 0L) {
            this.workerId = workerId;
        } else {
            throw new IllegalArgumentException(String.format("worker Id can't be greater than %d or less than 0", this.maxWorkerId));
        }
    }

    public synchronized long nextId() {
        long timestamp = System.currentTimeMillis();
        if (this.lastTimestamp == timestamp) {
            this.sequence = this.sequence + 1L & this.sequenceMask;
            if (this.sequence == 0L) {
                timestamp = this.tilNextMillis(this.lastTimestamp);
            }
        } else {
            this.sequence = 0L;
        }

        if (timestamp < this.lastTimestamp) {
            throw new RuntimeException(String.format("clock moved backwards.Refusing to generate id for %d milliseconds", this.lastTimestamp - timestamp));
        } else {
            this.lastTimestamp = timestamp;
            this.getClass();
            return timestamp - 1403854494756L << (int)this.timestampLeftShift | this.workerId << (int)this.workerIdShift | this.sequence;
        }
    }

    private long tilNextMillis(long lastTimestamp) {
        long timestamp;
        for(timestamp = System.currentTimeMillis(); timestamp <= lastTimestamp; timestamp = System.currentTimeMillis()) {
            ;
        }
        return timestamp;
    }
    
}