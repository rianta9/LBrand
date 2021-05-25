/**
 * 
 */
package com.rianta9.util;

/**
 * @author rianta9
 * @datecreated 22 thg 5, 2021 00:53:13
 */
public class StringHelper {
	public static String getIdFormat(Long id) {
		return String.format("#%09d", id);
	}
}
