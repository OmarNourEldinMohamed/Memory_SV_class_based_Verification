package env_P;
    import driver_P::*;
    import sequencer_P::*;
    import mailbox_P::*;
    import monitor_P::*;
    import scoreboard_P::*;
    import subscriber_P::*;

    class env;
        virtual interfaceX vif;
        driver drive;
        sequencer seq;
        monitor mon;
        scoreboard score;
        subscriber sub;

        function new();
            drive=new();
            seq=new();
            mon=new();
            score=new();
            sub=new();
        endfunction

        task start_test();
            repeat(1000)begin
                seq.start();
                drive.start();
                mon.start();
                score.start();
                sub.start();
            end
        endtask

    endclass
endpackage