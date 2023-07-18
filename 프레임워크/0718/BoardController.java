package egov.mywork1.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egov.mywork1.service.BoardService;
import egov.mywork1.service.BoardVO;
import egov.mywork1.service.DefaultVO;

@Controller
public class BoardController {
	
	@Resource(name="boardService") 
	BoardService boardService; 
	
	@RequestMapping("/boardWrite.do")
	public String boardWrite() {
		
		return "/board/boardWrite";
	}
	
	@RequestMapping("/boardWriteSave.do")
	@ResponseBody
	public String insertBoard(BoardVO vo) throws Exception {
		
		//암호체크 (6~12)
		String pass = vo.getPass();
		String str = "";
		if ( pass.length() < 6 || pass.length() > 12) {
			str = "len_over";
		} else {
			// insert -> 성공 : null 실패 : x(아무값없음)
			String result = boardService.insertBoard(vo);
			str = (result==null)?"true":"false";		
		}
		return str;
	}

	
	@RequestMapping("/boardList.do")
	public String selectBoardList(DefaultVO vo, ModelMap model)
											throws Exception {
		
		// 현재 페이지 번호
		int pageIndex = vo.getPageIndex();
		
		// fisrtIndex값 계산   1->1; 2->11; 3->21;
		int firstIndex = (pageIndex-1)*10 + 1;
		
		// lastIndex값 계산
		int lastIndex = firstIndex +(10-1);
		
		vo.setFirstIndex(firstIndex);
		vo.setLastIndex(lastIndex);
		
		int total = boardService.selectBoardTotal(vo);
		int lastPage = (int) Math.ceil((double)total/10);
		vo.setLastPage(lastPage);
		
		List<?> list = boardService.selectBoardList(vo);
				
		model.addAttribute("defaultVO",vo);
		model.addAttribute("total",total);
		model.addAttribute("resultList",list);
		
		return "board/boardList";
	}
	
	
}
