package invest.lixinger.index.fundamental.CN.VO;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;
@Data
public class fundamentalResult_RootVO {
    int code;
    String message;
    List<fundamentalReulst_DataVO> data=new ArrayList<>();
}
