/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *STD_TEXTIO;
char *WORK_P_1966318210;
char *IEEE_P_0774719531;
char *IEEE_P_3564397177;
char *IEEE_P_3620187407;
char *WORK_P_1745595347;
char *WORK_P_3593509614;
char *WORK_P_1922524060;
char *STD_STANDARD;
char *IEEE_P_3499444699;
char *IEEE_P_2592010699;
char *IEEE_P_1242562249;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_0774719531_init();
    ieee_p_1242562249_init();
    work_p_1922524060_init();
    work_p_1745595347_init();
    std_textio_init();
    ieee_p_3564397177_init();
    work_p_3593509614_init();
    work_p_1966318210_init();
    ieee_p_3620187407_init();
    work_a_2251915414_3212880686_init();
    work_a_1153420228_3212880686_init();
    work_a_2110357975_1336377457_init();
    work_a_4211684609_1692260737_init();
    work_a_1763732061_1692260737_init();
    work_a_0200802635_3212880686_init();
    work_a_1837393112_3212880686_init();
    work_a_4081929318_3212880686_init();
    work_a_2141559667_3212880686_init();
    work_a_2615964831_3212880686_init();
    work_a_1218917173_0708986588_init();
    work_a_0832606739_3212880686_init();
    work_a_2399776393_3212880686_init();
    work_a_4084620457_2318068820_init();
    work_a_3002075066_0831356973_init();
    work_a_1208337864_3212880686_init();
    work_a_1430113433_3212880686_init();
    work_a_3720894149_0831356973_init();
    work_a_1130845995_0831356973_init();
    work_a_1335952598_3212880686_init();
    work_a_1949178628_1985558087_init();


    xsi_register_tops("work_a_1949178628_1985558087");

    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    WORK_P_1966318210 = xsi_get_engine_memory("work_p_1966318210");
    IEEE_P_0774719531 = xsi_get_engine_memory("ieee_p_0774719531");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    WORK_P_1745595347 = xsi_get_engine_memory("work_p_1745595347");
    WORK_P_3593509614 = xsi_get_engine_memory("work_p_3593509614");
    WORK_P_1922524060 = xsi_get_engine_memory("work_p_1922524060");
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");

    return xsi_run_simulation(argc, argv);

}
